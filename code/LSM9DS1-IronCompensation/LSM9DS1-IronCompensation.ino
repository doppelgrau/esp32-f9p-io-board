// calibration after https://appelsiini.net/2018/calibrate-magnetometer/


// IO pins --------------------------------
#define I2C_SDA 32
#define I2C_SCL 33

// includes
#include <Wire.h>
#include <LSM9DS1_Registers.h>
#include <SparkFunLSM9DS1.h>
#include <LSM9DS1_Types.h>

// global variables
float hardIron[3];
float softIron[3];
int gyros[3];

// instances
LSM9DS1 imu;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(115200);
  Serial.println("-------------------------------------");
  Serial.println("ESP32 - LSM9DS1 Hard Iron calibration");
  Serial.println("-------------------------------------");
  Serial.println("");
  Serial.println("After each step press any");
  Serial.println("key is (over serial)");
  Serial.println("");
  // Setup IO

  // I2C
  Wire.begin(I2C_SDA, I2C_SCL, 400000);

  // Setup LSM9DS1
  Serial.println("Konfigure the LSM9DS1");
  imu.settings.device.commInterface = IMU_MODE_I2C;
  imu.settings.device.mAddress = 0x1C;
  imu.settings.device.agAddress = 0x6A;
  imu.settings.mag.scale = 4; // Set mag scale to +/-12 Gs
  // [sampleRate] sets the output data rate (ODR) of the
  // magnetometer.
  // mag data rate can be 0-7:
  // 0 = 0.625 Hz  4 = 10 Hz
  // 1 = 1.25 Hz   5 = 20 Hz
  // 2 = 2.5 Hz    6 = 40 Hz
  // 3 = 5 Hz      7 = 80 Hz
  imu.settings.mag.sampleRate = 5; // Set OD rate to 20Hz
  // [tempCompensationEnable] enables or disables
  // temperature compensation of the magnetometer.
  imu.settings.mag.tempCompensationEnable = true;
  // [XYPerformance] sets the x and y-axis performance of the
  // magnetometer to either:
  // 0 = Low power mode      2 = high performance
  // 1 = medium performance  3 = ultra-high performance
  imu.settings.mag.XYPerformance = 3; // Ultra-high perform.
  // [ZPerformance] does the same thing, but only for the z
  imu.settings.mag.ZPerformance = 3; // Ultra-high perform.
  // [lowPowerEnable] enables or disables low power mode in
  // the magnetometer.
  imu.settings.mag.lowPowerEnable = false;
  if (!imu.begin()) {
    Serial.println("Failed to communicate with LSM9DS1.");
  }

  Serial.println("Leave board in position, no movement (gyro calibration)");
  Serial.println("Press to continue");
  while (Serial.read() == -1 ) {
    delay(1);
  }

  // read 256 Values, then shift 8 bit for correction values
  for (int i = 0; i < 256; i++) {
    imu.readGyro();
    gyros[0] += imu.gx;
    gyros[1] += imu.gy;
    gyros[2] += imu.gz;
    delay(50);
  }
  gyros[0] = gyros[0] >> 8; 
  gyros[1] = gyros[1] >> 8;
  gyros[2] = gyros[2] >> 8;

  // Hard iron calibration
  Serial.println("Now: Slowly turn around all axis (magnetometer - hard iron)");
  Serial.println("After enough turns press any key");
  int calData[3][2] = {{32767, -32767}, {32767, -32767}, {32767, -32767}};

  while (Serial.read() == -1 ) {
    delay(50);
    // To read from the magnetometer, you must first call the
    // readMag() function. When this exits, it'll update the
    // mx, my, and mz variables with the most current data.
    imu.readMag();
    if (imu.mx < calData[0][0]) {
      calData[0][0] = imu.mx;
    }
    if (imu.mx > calData[0][1]) {
      calData[0][1] = imu.mx;
    }
    if (imu.my < calData[1][0]) {
      calData[1][0] = imu.my;
    }
    if (imu.my > calData[1][1]) {
      calData[1][1] = imu.my;
    }
    if (imu.mz < calData[2][0]) {
      calData[2][0] = imu.mz;
    }
    if (imu.mz > calData[2][1]) {
      calData[2][1] = imu.mz;
    }
  }

  // calculate hard iron compensation
  hardIron[0] = (calData[0][0] + calData[0][1]) / 2;
  hardIron[1] = (calData[1][0] + calData[1][1]) / 2;
  hardIron[2] = (calData[2][0] + calData[2][1]) / 2;

  Serial.println("");

  // Soft iron calibration
  Serial.println("Slowly turn around all axis (magnetometer - soft iron)");
  Serial.println("After enough turns press any key");

  int calData2[3][2] = {{32767, -32767}, {32767, -32767}, {32767, -32767}};
  while (Serial.read() == -1 ) {
    delay(50);
    // To read from the magnetometer, you must first call the
    // readMag() function. When this exits, it'll update the
    // mx, my, and mz variables with the most current data.
    imu.readMag();
    if ((imu.mx - hardIron[0]) < calData2[0][0]) {
      calData2[0][0] = (imu.mx - hardIron[0]);
    }
    if ((imu.mx - hardIron[0]) > calData2[0][1]) {
      calData2[0][1] = (imu.mx - hardIron[0]);
    }
    if ((imu.my - hardIron[1]) < calData2[1][0]) {
      calData2[1][0] = (imu.my - hardIron[1]);
    }
    if ((imu.my - hardIron[1]) > calData2[1][1]) {
      calData2[1][1] = (imu.my - hardIron[1]);
    }
    if ((imu.mz - hardIron[2]) < calData2[2][0]) {
      calData2[2][0] = (imu.mz - hardIron[2]);
    }
    if ((imu.mz - hardIron[2]) > calData2[2][1]) {
      calData2[2][1] = (imu.mz - hardIron[2]);
    }
  }

  // calculate soft iron data
  softIron[0] = float((calData2[0][1] - calData2[0][0])) / 2;
  softIron[1] = float((calData2[1][1] - calData2[1][0])) / 2;
  softIron[2] = float((calData2[2][1] - calData2[2][0])) / 2;

  float avgDelta = (softIron[0] + softIron[1] + softIron[3]) / 3;

  softIron[0] = avgDelta / softIron[0];
  softIron[1] = avgDelta / softIron[1];
  softIron[2] = avgDelta / softIron[2];
}

int ironCorrction(byte axis, int rawValue) {
  return round((rawValue - hardIron[axis]) * softIron[axis]);
}

void loop() {
  printGyro();  // Print "G: gx, gy, gz"
  printAccel(); // Print "A: ax, ay, az"
  printMag();   // Print "M: mx, my, mz"

  // Print the heading and orientation for fun!
  // Call print attitude. The LSM9DS1's magnetometer x and y
  // axes are opposite to the accelerometer, so my and mx are
  // substituted for each other.
  printAttitude(imu.ax, imu.ay, imu.az, -1 * ironCorrction(1,imu.my), -1 * ironCorrction(0,imu.mx), -1 * ironCorrction(2,imu.mz));
  Serial.println();
  delay(500);

}


void printGyro()
{
  // To read from the gyroscope, you must first call the
  // readGyro() function. When this exits, it'll update the
  // gx, gy, and gz variables with the most current data.
  imu.readGyro();

  // Now we can use the gx, gy, and gz variables as we please.
  // Either print them as raw ADC values, or calculated in DPS.
  Serial.print("G: ");
  // If you want to print calculated values, you can use the
  // calcGyro helper function to convert a raw ADC value to
  // DPS. Give the function the value that you want to convert.
  Serial.print(imu.calcGyro(imu.gx - gyros[0]), 2);
  Serial.print(", ");
  Serial.print(imu.calcGyro(imu.gy - gyros[1]), 2);
  Serial.print(", ");
  Serial.print(imu.calcGyro(imu.gz - gyros[2]), 2);
  Serial.println(" deg/s");
}

void printAccel()
{
  // To read from the accelerometer, you must first call the
  // readAccel() function. When this exits, it'll update the
  // ax, ay, and az variables with the most current data.
  imu.readAccel();

  // Now we can use the ax, ay, and az variables as we please.
  // Either print them as raw ADC values, or calculated in g's.
  Serial.print("A: ");
  // If you want to print calculated values, you can use the
  // calcAccel helper function to convert a raw ADC value to
  // g's. Give the function the value that you want to convert.
  Serial.print(imu.calcAccel(imu.ax), 2);
  Serial.print(", ");
  Serial.print(imu.calcAccel(imu.ay), 2);
  Serial.print(", ");
  Serial.print(imu.calcAccel(imu.az), 2);
  Serial.println(" g");

}

void printMag()
{
  // To read from the magnetometer, you must first call the
  // readMag() function. When this exits, it'll update the
  // mx, my, and mz variables with the most current data.
  imu.readMag();

  // Now we can use the mx, my, and mz variables as we please.
  // Either print them as raw ADC values, or calculated in Gauss.
  Serial.print("M: ");
  // If you want to print calculated values, you can use the
  // calcMag helper function to convert a raw ADC value to
  // Gauss. Give the function the value that you want to convert.
  Serial.print(imu.calcMag(ironCorrction(0,imu.mx)), 2);
  Serial.print(", ");
  Serial.print(imu.calcMag(ironCorrction(1,imu.my)), 2);
  Serial.print(", ");
  Serial.print(imu.calcMag(ironCorrction(2,imu.mz)), 2);
  Serial.println(" gauss");
}

// Calculate pitch, roll, and heading.
// Pitch/roll calculations take from this app note:
// http://cache.freescale.com/files/sensors/doc/app_note/AN3461.pdf?fpsp=1
// Heading calculations taken from this app note:
// http://www51.honeywell.com/aero/common/documents/myaerospacecatalog-documents/Defense_Brochures-documents/Magnetic__Literature_Application_notes-documents/AN203_Compass_Heading_Using_Magnetometers.pdf
void printAttitude(
  float ax, float ay, float az, float mx, float my, float mz)
{
  float roll = atan2(ay, az);
  float pitch = atan2(-ax, sqrt(ay * ay + az * az));

  float heading;
  if (my == 0)
    heading = (mx < 0) ? 180.0 : 0;
  else
    heading = atan2(mx, my);

  //  heading -= DECLINATION * PI / 180;

  if (heading > PI) heading -= (2 * PI);
  else if (heading < -PI) heading += (2 * PI);

  // Convert everything from radians to degrees:
  heading *= 180.0 / PI;
  pitch *= 180.0 / PI;
  roll  *= 180.0 / PI;

  Serial.print("Pitch, Roll: ");
  Serial.print(pitch, 2);
  Serial.print(", ");
  Serial.println(roll, 2);
  Serial.print("Heading: "); Serial.println(heading, 2);
}
