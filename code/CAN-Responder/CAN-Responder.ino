/*
 * Just a very simple sketch that receives a can-message, and responds with an other message.
 * Other side for the HW-Test
 * Uses arduino-can: https://github.com/sandeepmistry/arduino-CAN
 */

#define CAN_TX 5
#define CAN_RX 35

#include <CAN.h>

void setup() {
  Serial.begin(115200);
  Serial.println("CAN Receiver");

  // configure CAN-interface
  CAN.setPins(CAN_RX, CAN_TX);

  // start the CAN bus at 500 kbps
  if (!CAN.begin(500E3)) {
    Serial.println("Starting CAN failed!");
    while (1);
  }
}

void loop() {
  // try to parse packet
  int packetSize = CAN.parsePacket();

  if (packetSize) {
    // received a packet
    Serial.print("Received ");

    Serial.print("packet with id 0x");
    Serial.print(CAN.packetId(), HEX);
    Serial.print(" and length ");
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

}
