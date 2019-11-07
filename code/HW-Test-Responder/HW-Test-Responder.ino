/*
 * Just a very simple sketch that receives a can-message, and responds with an other message.
 * Also responds on a uart, ethernet and switches M1 on for a short period of time after some can message
 * Other side for the HW-Test
 * Uses arduino-can: https://github.com/sandeepmistry/arduino-CAN
 */

#define CAN_TX 5
#define CAN_RX 35
#define I2C_SDA 32
#define I2C_SCL 33
#define VNH_A_PWM 4
#define VNH_B_PWM 12
#define UART_RX 2
#define UART_TX 0
// Ethernet
#define ETH_CLK_MODE    ETH_CLOCK_GPIO17_OUT
#define ETH_POWER_PIN   -1
#define ETH_TYPE        ETH_PHY_LAN8720
#define ETH_ADDR        0
#define ETH_MDC_PIN     23
#define ETH_MDIO_PIN    18

#include <CAN.h>
#include <Wire.h>
#include <ETH.h>
#include <WebServer.h>
#include <string.h>

WebServer server(80);
int counter = 0;

uint8_t setByteI2C(int address, byte i2cregister, byte value) {
  Wire.beginTransmission(address);
  Wire.write(i2cregister);
  Wire.write(value);
  return Wire.endTransmission();
}

void handle_OnConnect() {
  Serial.println("Received http request");
  server.send(200, "text/html", "Success!"); 
}

void setup() {
  Serial.begin(115200);
  Serial.println("HW-Test Responder");

  // configure CAN-interface
  CAN.setPins(CAN_RX, CAN_TX);
  // start the CAN bus at 500 kbps
  if (!CAN.begin(500E3)) {
    Serial.println("Starting CAN failed!");
    while (1);
  }
  // configure uart
  gpio_pad_select_gpio(GPIO_NUM_2);
  gpio_set_direction(GPIO_NUM_2, GPIO_MODE_INPUT);
  gpio_pad_select_gpio(GPIO_NUM_0);
  gpio_set_direction(GPIO_NUM_0, GPIO_MODE_OUTPUT);
  Serial1.begin(19200, SERIAL_8N1, UART_TX, UART_RX);

  // configure I2C
  Wire.begin(I2C_SDA, I2C_SCL, 400000);

  //FXL6408
  // direction (Input/Output)
  setByteI2C(0x43, 0x03, 0b11111110);
  // disable High-Z on outputs
  setByteI2C(0x43, 0x07, 0b00000001);
  // en-/disable Pullup/downs
  setByteI2C(0x43, 0x0B, 0b00000001);
  // set direction of the pull
  setByteI2C(0x43, 0x0D, 0b00000001);
  // configure PWM for M1
  ledcSetup(0, 1500, 8);
  ledcAttachPin(VNH_A_PWM, 0);
  ledcWrite(0, 255);

  // configure ethernet
  // enable the LAN8720
  setByteI2C(0x43, 0x05, 0b00000010);

  // Start Network
  ETH.begin(ETH_ADDR, ETH_POWER_PIN, ETH_MDC_PIN, ETH_MDIO_PIN, ETH_TYPE, ETH_CLK_MODE);
  ETH.config(IPAddress(10, 0, 1, 203),IPAddress(0, 0, 0, 0),IPAddress(255, 255, 255, 0),IPAddress(0, 0, 0, 0),IPAddress(0, 0, 0, 0));

  // webserver
  server.on("/", handle_OnConnect);

}

void loop() {
  // status LED
  if ((counter++ % 256) < 128) {
    setByteI2C(0x43, 0x05, 0b00000110);
  } else {
    setByteI2C(0x43, 0x05, 0b00000010);
  }
  
  // webserver
  server.handleClient();

  // uart
  while (Serial1.available()) {
    char byteRead = Serial1.read();
    Serial.print("Received on uart: ");
    Serial.println(byteRead);
    Serial1.write(byteRead);
  }
      
  // CAN
  // try to parse packet
  int packetSize = CAN.parsePacket();

  if (packetSize) {
    // received a packet
    Serial.print("Received ");

    Serial.print("packet with id 0x");
    int packetId = CAN.packetId();
    Serial.println(packetId, HEX);
    if (packetId == 0x10) {
      Serial.print("   Length ");
      Serial.print(packetSize);
      Serial.print(" and data: ");
      while (CAN.available()) {
        Serial.print((char)CAN.read());
      }
      Serial.println();
  
      delay(100);
      
      // send response
      Serial.print("Sending response ... ");
  
      CAN.beginPacket(0x12);
      CAN.write('a');
      CAN.write('c');
      CAN.write('k');
      CAN.endPacket();
      Serial.println("done");
    }
    if (packetId == 0x05) {
       Serial.print("Buzzer ... ");
      //enable M1
      setByteI2C(0x43, 0x05, 0b00001010);
      delay(50);
      // disable again
      setByteI2C(0x43, 0x05, 0b00000010);
      Serial.println("off");
    }
  }
  delay(5);
}
