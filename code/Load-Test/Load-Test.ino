// IO pins --------------------------------
#define VNH_A_PWM 4
#define VNH_A_E1 0
#define VNH_A_E2 2
#define VNH_B_PWM 12
#define I2C_SDA 32
#define I2C_SCL 33
// includes
#include <Wire.h>


void setup() {
  // initialize PINs for VNHs
  pinMode(VNH_A_PWM, OUTPUT);
  pinMode(VNH_A_E1, OUTPUT);
  pinMode(VNH_A_E2, OUTPUT);
  pinMode(VNH_B_PWM, OUTPUT);

  // PWM for outputs
  //   PWM-Channel
  ledcSetup(0, 10000, 8);
  //   IO-PINs
  ledcAttachPin(VNH_A_PWM, 0);
  ledcAttachPin(VNH_B_PWM, 0);



  // I2C
  Wire.begin(I2C_SDA, I2C_SCL, 400000);

  // Baustein konfigurieren
  // direction (Input/Output)
  setByteI2C(0x43, 0x03, 0b11101111);
  // disable High-Z on outputs
  setByteI2C(0x43, 0x07, 0b00010000);
  // en-/disable Pullup/downs
  setByteI2C(0x43, 0x0B, 0b00010000);
  // set direction of the pull
  setByteI2C(0x43, 0x0D, 0b00010000);

}
void loop() {
  // duty cyle
  ledcWrite(0, 230);
  
  digitalWrite(VNH_A_E1, HIGH);
  digitalWrite(VNH_A_E2, LOW);
  setByteI2C(0x43, 0x05, 0b10100010);

  // warten 0,5s
  delay(500);

  // duty cyle
  ledcWrite(0, 25);

  // und andersherum
  digitalWrite(VNH_A_E1, LOW);
  digitalWrite(VNH_A_E2, HIGH);
  setByteI2C(0x43, 0x05, 0b01000100);
  // warten 0,5s
  delay(500);
}


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
