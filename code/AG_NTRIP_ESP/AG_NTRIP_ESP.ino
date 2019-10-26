TaskHandle_t Core1;
TaskHandle_t Core2;
// ESP32 Ntrip Client by Coffeetrac
// Release: V1.26
// 01.01.2019 W.Eder
// Enhanced by Matthias Hammer 12.01.2019
// Add by Takeuchi Minolu 27.10.2019
//##########################################################################################################
//### Setup Zone ###########################################################################################
//### Just Default values ##################################################################################
struct Storage{
  
  char ssid[24]        = "***************";          // WiFi network Client name
  char password[24]    = "*************";      // WiFi network password

  unsigned long timeoutRouter = 65;           // Time (seconds) to wait for WIFI access, after that own Access Point starts 

  // Ntrip Caster Data
  char host[40]        = "**********";    // Server IP
  int  port            = 2101;                // Server Port
  char mountpoint[40]  = "********";   // Mountpoint
  char ntripUser[40]   = "guest";     // Username
  char ntripPassword[40]= "guest";    // Password


  byte sendGGAsentence = 0  ; // 0 = No Sentence will be sended
                            // 1 = fixed Sentence from GGAsentence below will be sended
                            // 2 = GGA from GPS will be sended
  
  byte GGAfreq =5;         // time in seconds between GGA Packets

  char GGAsentence[100] = "$GPGGA,121532.502,3457.224,N,13656.113,E,1,12,1.0,0.0,M,0.0,M,,*6A"; //hc create via www.nmeagen.org
  
  long baudOut = 38400;     // Baudrate of RTCM Port

  byte send_UDP_AOG  = 1;   // 0 = Transmission of NMEA Off
                            // 1 = Transmission of NMEA Sentences to AOG via Ethernet-UDP
                            // 2 = Bluetooth attention: not possible if line useBluetooth = false

  byte enableNtrip   = 1;   // 0 = NTRIP disabled
                            // 1 = ESP NTRIP Client enabled
                            // 2 = AOG NTRIP Client enabled (Port=2233)
  
  byte AHRSbyte      = 4;   // 0 = No IMU, No Inclinometer
                            // 1 = BNO055 IMU installed
                            // 2 = MMA8452 Inclinometer installed
                            // 3 = BNO055 + MMA 8452 installed
                            // 4 = LSM9DS1 Inclinometer installed
}; Storage NtripSettings;



//##########################################################################################################
//### End of Setup Zone ####################################################################################
//##########################################################################################################

boolean debugmode = false;
#define useBluetooth  1  // 1= possibility to use bluetooth to transfer data to AOG later on, but needs lots of memory.

// IO pins --------------------------------
#define RX0      3//3 usb
#define TX0      1//1


//#define LED_PIN_WIFI   2   
#define ANALOG_INPUT1 36
#define ANALOG_INPUT2 39
#define ANALOG_INPUT3 34
#define I2C_SDA 32
#define I2C_SCL 33
#define VNH_A_PWM 4
#define VNH_B_PWM 12
#define F9P_RX 14
#define F9P_TX 13
#define RS232_RX 16
#define RS232_TX 15
#define UART_RX 2
#define UART_TX 0
//########## BNO055 adress 0x28 ADO = 0 set in BNO_ESP.h means ADO -> GND
//########## MMA8451 adress 0x1D SAO = 0 set in MMA8452_AOG.h means SAO open (pullup!!)

#define restoreDefault_PIN 2  // set to 1 during boot, to restore the default values
                              // OR push Setup SW1 on board,to restore the default values
                              // WiFistatus LED D2 on bord
//libraries -------------------------------
#include <Wire.h>
#include <WiFi.h>
#include <base64.h>
#include "Network_AOG.h"
#include "EEPROM.h"

#include "Adafruit_ADS1015.h"
#include "driver/gpio.h"
#include "LSM9DS1_Registers.h"
#include "SparkFunLSM9DS1.h"
#include "LSM9DS1_Types.h"

#include "BNO_ESP.h"
#include "MMA8452_AOG.h"
//#include "BluetoothSerial.h"

// Declarations
void DBG(String out, byte nl = 0);

//Accesspoint name and password:
const char* ssid_ap     = "NTRIP_Client_ESP_Net";
const char* password_ap = "";

//static IP
IPAddress myip(192, 168, 3,7);  // Roofcontrol module
IPAddress gwip(192, 168, 3, 1);   // Gateway & Accesspoint IP
IPAddress mask(255, 255, 255, 0);
IPAddress myDNS(8, 8, 8, 8);      //optional

unsigned int portMy = 5544;       //this is port of this module: Autosteer = 5577 IMU = 5566 GPS = 
unsigned int portAOG = 8888;      // port to listen for AOG
unsigned int portMyNtrip = 2233;

//IP address to send UDP data to:
IPAddress ipDestination(192, 168, 3, 255);
unsigned int portDestination = 9999;  // Port of AOG that listens

// Variables ------------------------------
// blink times: searching WIFI: blinking 4x faster; connected: blinking as times set; data available: light on; no data for 2 seconds: blinking
unsigned int LED_WIFI_time = 0;
unsigned int LED_WIFI_pulse = 700;   //light on in ms 
unsigned int LED_WIFI_pause = 700;   //light off in ms
boolean LED_WIFI_ON = false;
unsigned long Ntrip_data_time = 0;

// program flow
bool AP_running=0, EE_done = 0, restart=0;
int value = 0; 
unsigned long repeat_ser;   
//int error = 0;
unsigned long repeatGGA, lifesign, aogntriplife;

//loop time variables in microseconds
const unsigned int LOOP_TIME = 100; //10hz 
unsigned int lastTime = LOOP_TIME;
unsigned int currentTime = LOOP_TIME;
unsigned int dT = 50000;

//Kalman variables
float rollK = 0, Pc = 0.0, G = 0.0, P = 1.0, Xp = 0.0, Zp = 0.0;
float XeRoll = 0;
const float varRoll = 0.1; // variance,
const float varProcess = 0.0055; //0,00025 smaller is more filtering

// GPS-Bridge
int cnt=0;
int i=0;  
byte gpsBuffer[100], c;
char imuBuffer[20];
bool newSentence = false;
bool newIMUSentence = false;
char lastSentence[100]="";

char strmBuf[512];         // rtcm Message Buffer

//IMU, inclinometer variables
bool imu_initialized = 0;
int roll = 0, roll_corr = 0;
unsigned int x_ , y_ , z_;

//Array to send data back to AgOpenGPS
byte GPStoSend[100]; 
byte IMUtoSend[] = {0x7F,0xEE,0,0,0,0,0,0,0,0};
byte IMUtoSendLenght = 10; //lenght of array to AOG

//steering variables
float steerAngleActual = 0;
int steerPrevSign = 0, steerCurrentSign = 0; // the steering wheels angle currently and previous one
int16_t isteerAngleSetPoint = 0; //the desired angle from AgOpen
float steerAngleSetPoint = 0;
long steeringPosition = 0, steeringPosition_corr = 0,actualSteerPos=0; //from steering sensor
float steerAngleError = 0; //setpoint - actual
float distanceError = 0; //
volatile int  pulseACount = 0, pulseBCount = 0;; // Steering Wheel Encoder

// Instances ------------------------------
MMA8452 accelerometer;
WiFiServer server(80);
WiFiClient ntripCl;
WiFiClient client_page;
AsyncUDP udpRoof;
AsyncUDP udpNtrip;
LSM9DS1 imu;

uint8_t getByteI2C(int address, int i2cregister) {
  Wire.beginTransmission(address);
  Wire.write(i2cregister);
  Wire.endTransmission(false);
  uint8_t state = Wire.requestFrom(address, 1, (int)true);
  return Wire.read();
}

uint8_t setByteI2C(int address, byte i2cregister, byte value) {
  Wire.beginTransmission(address);
  Wire.write(i2cregister);
  Wire.write(value);
  return Wire.endTransmission();
}

void led_on(){
  setByteI2C(0x43, 0x05, 0b00000100);
}

void led_off(){
  setByteI2C(0x43, 0x05, 0b00000000);
}
// Setup procedure ------------------------
void setup() {
  Serial.begin(115200);
  Wire.begin(I2C_SDA, I2C_SCL, 400000);
  pinMode(restoreDefault_PIN, INPUT);  //
  //IMU setting
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
  imu.begin();
  //  Serial1.begin (NtripSettings.baudOut, SERIAL_8N1, F9P_RX, F9P_TX); 
  if (debugmode) { Serial1.begin(115200, SERIAL_8N1, F9P_RX, F9P_TX); } //set new Baudrate
  else { Serial1.begin(NtripSettings.baudOut, SERIAL_8N1, F9P_RX, F9P_TX); } //set new Baudrate
  Serial2.begin(115200,SERIAL_8N1,RS232_RX,RS232_TX); 
  
  // Setup PINs for VNHs Motor driver
  pinMode(VNH_A_PWM, OUTPUT);
  pinMode(VNH_B_PWM, OUTPUT);
  ledcSetup(0, 1500, 8);
  ledcAttachPin(VNH_A_PWM, 0);
  
  // analog inputs - set input to explicit disable any pullups
  pinMode(ANALOG_INPUT1, INPUT);
  pinMode(ANALOG_INPUT2, INPUT);
  pinMode(ANALOG_INPUT3, INPUT);
  analogReadResolution(10); // Default of 12 is not very linear. Recommended to use 10 or 11 depending on needed resolution.
  analogSetAttenuation(ADC_11db); // Default is 11db which is very noisy. But needed for full scale range  Recommended to use 2.5 or 6.

  //Setup PINs for FXL6408 GPIO Expander
  // direction (Input/Output)
  setByteI2C(0x43, 0x03, 0b11111110);
  // disable High-Z on outputs
  setByteI2C(0x43, 0x07, 0b00000001);
  // en-/disable Pullup/downs
  setByteI2C(0x43, 0x0B, 0b00000001);
  // set direction of the pull
  setByteI2C(0x43, 0x0D, 0b00000001);

 restoreEEprom();

 //pinMode(LED_PIN_WIFI, OUTPUT);
   
  //------------------------------------------------------------------------------------------------------------  
  //create a task that will be executed in the Core1code() function, with priority 1 and executed on core 0
  xTaskCreatePinnedToCore(Core1code, "Core1", 10000, NULL, 1, &Core1, 0);
  delay(500); 
  //create a task that will be executed in the Core2code() function, with priority 1 and executed on core 1
  xTaskCreatePinnedToCore(Core2code, "Core2", 10000, NULL, 1, &Core2, 1); 
  delay(500); 
  //------------------------------------------------------------------------------------------------------------
 
}

void loop() {
}

//--------------------------------------------------------------
//  Debug Messaging
//--------------------------------------------------------------
bool debug = 1;  // Print Debug Messages to Serial0

void DBG(String out, byte nl){
  if (debug == 1) {
    if (nl) Serial.println(out);
    else Serial.print(out);
  }
}

void DBG(int out, byte nl = 0){
  if (debug == 1) {
    if (nl) Serial.println(out);
    else Serial.print(out);
  }
}

void DBG(long out, byte nl = 0){
  if (debug == 1) {
    if (nl) Serial.println(out);
    else Serial.print(out);
  }
}

void DBG(char out, byte nl = 0){
  if (debug == 1) {
    if (nl) Serial.println(out);
    else Serial.print(out);
  }
}

void DBG(char out, byte type, byte nl = 0){ // type = HEX,BIN,DEZ..
  if (debug == 1) {
    if (nl) Serial.println(out,type);
    else Serial.print(out,type);
  }
}

void DBG(IPAddress out, byte nl = 0){
  if (debug == 1) {
    if (nl) Serial.println(out);
    else Serial.print(out);
  }
}
