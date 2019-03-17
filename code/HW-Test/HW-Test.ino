// IO pins --------------------------------
#define LED_INTERNAL 2
#define LED_EXTERNAL1 32
#define LED_EXTERNAL2 33
#define ANALOG_INPUT_WS 39
#define ANALOG_INPUT_AS 36
#define ANALOG_INPUT_RESERVE 34
#define I2C_SDA 21
#define I2C_SCL 22
#define VNH_A_PWM 15
#define VNH_A_E1 4
#define VNH_A_E2 2
#define VNH_B_PWM 14
#define VNH_B_E1 13
#define VNH_B_E2 12
#define F9P_RX 16
#define F9P_TX 17
// includes
#include "MMA8452_AOG.h"
#include "Adafruit_ADS1015.h"
#include <Wire.h>

// global variables
int check = 1;
int state = 0;

// instances
MMA8452 accelerometer;
Adafruit_ADS1115 ads = Adafruit_ADS1115(0x49);

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(115200);
  Serial.println("-------------------------------------");
  Serial.println("ESP32 - F9P - IO-Board Tester");
  Serial.println("-------------------------------------");
  Serial.println("");
  Serial.println("Each test will be repeated until any");
  Serial.println("key is pressed (over serial)");
  Serial.println("");
  // Setup IO
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_INTERNAL, OUTPUT);
  pinMode(LED_EXTERNAL1, OUTPUT);
  pinMode(LED_EXTERNAL2, OUTPUT);

  // initialize PINs for VNHs
  pinMode(VNH_A_PWM, OUTPUT);
  pinMode(VNH_A_E1, OUTPUT);
  pinMode(VNH_A_E2, OUTPUT);
  pinMode(VNH_B_PWM, OUTPUT);
  pinMode(VNH_B_E1, OUTPUT);
  pinMode(VNH_B_E2, OUTPUT);

  // analog inputs - set input to explicit disable any pullups
  pinMode(ANALOG_INPUT_WS, INPUT);
  pinMode(ANALOG_INPUT_AS, INPUT);
  pinMode(ANALOG_INPUT_RESERVE, INPUT);
  analogReadResolution(10); // Default of 12 is not very linear. Recommended to use 10 or 11 depending on needed resolution.
  analogSetAttenuation(ADC_6db); // Default is 11db which is very noisy. Recommended to use 2.5 or 6.

  // I2C
  Wire.begin(I2C_SDA, I2C_SCL, 400000);

  // PWM for outputs
  //   PWM-Channel
  ledcSetup(0, 1500, 8);
  //   IO-PINs
  ledcAttachPin(VNH_A_PWM, 0);
  ledcAttachPin(VNH_B_PWM, 0);

  // Serial for F9P
  Serial2.begin(38400, SERIAL_8N1, F9P_RX, F9P_TX);


  Serial.println("Press to continue");
  while (Serial.read() == -1 ) {
    delay(1);
  }

}
void loop() {
  switch (check) {
    case 1:
      Serial.println("Toggle Internal LED");
      if (state % 2 == 0) {
        digitalWrite(LED_INTERNAL, HIGH);
      } else {
        digitalWrite(LED_INTERNAL, LOW);
      }
      state += 1;
      break;
    case 2:
      Serial.println("Toggle external LED 1");
      if (state % 2 == 0) {
        digitalWrite(LED_EXTERNAL1, HIGH);
      } else {
        digitalWrite(LED_EXTERNAL1, LOW);
      }
      state += 1;
      break;
    case 3:
      Serial.println("Toggle external LED 2");
      if (state % 2 == 0) {
        digitalWrite(LED_EXTERNAL2, HIGH);
      } else {
        digitalWrite(LED_EXTERNAL2, LOW);
      }
      state += 1;
      break;
    case 4: {
        int reading = analogRead(ANALOG_INPUT_WS);
        String output = "Analog Input WS: ";
        output += reading;
        reading = analogRead(ANALOG_INPUT_AS);
        output += " - AS: ";
        output += reading;
        reading = analogRead(ANALOG_INPUT_RESERVE);
        output += " - Reserve: " ;
        output += reading;
        Serial.println(output);
      } break;
    case 5: {
        Serial.println("Try to initialize MMA");
        if (accelerometer.init()) {
          Serial.println("successfull, go to data aquire-check");
          check += 1;
        } else {
          Serial.println("failed, skip data aquire-check");
          check += 2;
        }
      } break;
    case 6: {
        uint16_t x_ , y_ , z_;
        int16_t temp = 0;
        accelerometer.getRawData(&x_, &y_, &z_);
        String output = "MMA x: ";
        temp = x_;
        output += temp;
        output += " - y: ";
        temp = y_;
        output += temp;
        output += " - z: " ;
        temp = z_;
        output += temp;
        Serial.println(output);
      } break;
    case 7: {
        int temp = 0;
        String output = "ADS diff-0/1: ";
        temp = ads.readADC_Differential_0_1();
        output += temp;
        output += " - diff-2/3: ";
        temp = ads.readADC_Differential_2_3();
        output += temp;
        Serial.println(output);
      } break;
    case 8: {
        String output = "VNH7070 A - PWM: ";
        int temp = state % 256;
        ledcWrite(0, temp);
        output += temp;
        output += " - direction: ";
        temp = (state / 256) % 2;
        if (temp == 0) {
          digitalWrite(VNH_A_E1, HIGH);
          digitalWrite(VNH_A_E2, LOW);
        } else {
          digitalWrite(VNH_A_E2, HIGH);
          digitalWrite(VNH_A_E1, LOW);
        }
        output += temp;
        Serial.println(output);
        state += 5;
      } break;
    case 9: {
        String output = "VNH7070 B - PWM: ";
        int temp = state % 256;
        ledcWrite(0, temp);
        output += temp;
        output += " - direction: ";
        temp = (state / 256) % 2;
        if (temp == 0) {
          digitalWrite(VNH_B_E1, HIGH);
          digitalWrite(VNH_B_E2, LOW);
        } else {
          digitalWrite(VNH_B_E2, HIGH);
          digitalWrite(VNH_B_E1, LOW);
        }
        output += temp;
        Serial.println(output);
        state += 5;
      } break;
    case 10: {
        if (state == 0) {
          Serial.println("");
          Serial.print("F9P NMEA: ");
          state = 1;
        }
        while (Serial2.available()) {
          byte c = Serial2.read();
          //Serial2.print(c);
          if (c == 0x0D) {
            state = 0;
          }
          Serial.print((char)c);
        }
      } break;
    default:
      // no more checks
      Serial.println("Finished");
      break;
  }
  if (Serial.read() == -1 ) {
    delay(333);
  } else {
    check += 1;
    state = 0;
    // Reset some PINs
    digitalWrite(VNH_A_E1, LOW);
    digitalWrite(VNH_A_E2, LOW);
    digitalWrite(VNH_B_E1, LOW);
    digitalWrite(VNH_B_E2, LOW);
    digitalWrite(LED_INTERNAL, LOW);
    digitalWrite(LED_EXTERNAL1, LOW);
    digitalWrite(LED_EXTERNAL2, LOW);
  }

}
