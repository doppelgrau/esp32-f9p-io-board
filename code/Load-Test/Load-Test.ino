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

}
void loop() {
  int poti = ads.readADC_Differential_0_1();
  int ref = ads.readADC_Differential_2_3();

  int output = (poti / (float)ref) * 256;
  ledcWrite(0, output);
  
  digitalWrite(VNH_A_E1, HIGH);
  digitalWrite(VNH_A_E2, LOW);
  digitalWrite(VNH_B_E1, HIGH);
  digitalWrite(VNH_B_E2, LOW);

  delay(100);
}
