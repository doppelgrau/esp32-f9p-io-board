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

void SetRelays(void)
 {
    if (bitRead(relay,0)) digitalWrite(led1, HIGH);
    else digitalWrite(led1, LOW);
    if (bitRead(relay,1)) digitalWrite(led2, HIGH);
    else digitalWrite(led2, LOW); 
    //if (bitRead(relay,2)) digitalWrite(led3, HIGH);
    //else digitalWrite(led3, LOW); 
    //if (bitRead(relay,3)) digitalWrite(led4, HIGH);
    //else digitalWrite(led4, LOW); 
    
    //if (bitRead(relay,4)) bitSet(PORTB, 1); //Digital Pin 9
    //else bitClear(PORTB, 1); 
    //if (bitRead(relay,5)) bitSet(PORTB, 4); //Digital Pin 12
    //else bitClear(PORTB, 4); 
    //if (bitRead(relay,6)) bitSet(PORTC, 4); //analog Pin A4
    //else bitClear(PORTC, 4); 
    //if (bitRead(relay,7)) bitSet(PORTC, 5); //Analog Pin A5
    //else bitClear(PORTC, 5); 
  }

//--------------------------------------------------------------
//  EEPROM Data Handling
//--------------------------------------------------------------
#define EEPROM_SIZE 128
#define EE_ident1 0xDE  // Marker Byte 0 + 1
#define EE_ident2 0xEA

//--------------------------------------------------------------
//  Restore EEprom Data
//--------------------------------------------------------------
void restoreEEprom(){
  //byte get_state  = digitalRead(restoreDefault_PIN);

  byte get_state = getByteI2C(0x43, 0x0F);//setupSW1
  get_state &= 0b00000001;
   
  if (EEprom_empty_check()==1 || !get_state) { //first start?
    Serial.println("EEprom write default data");
    EEprom_write_all();     //write default data
   }
  if (EEprom_empty_check()==2) { //data available
    EEprom_read_all();
   }
  //EEprom_show_memory();  //
  EE_done =1;   
}

//--------------------------------------------------------------
byte EEprom_empty_check(){
    
  if (!EEPROM.begin(EEPROM_SIZE))  
    {
     Serial.println("failed to initialise EEPROM"); delay(1000);
     return false;
    }
  if (EEPROM.read(0)!= EE_ident1 || EEPROM.read(1)!= EE_ident2)
     return true;  // is empty
  
  if (EEPROM.read(0)== EE_ident1 && EEPROM.read(1)== EE_ident2)
     return 2;     // data available
     
 }
//--------------------------------------------------------------
void EEprom_write_all(){
  EEPROM.write(0, EE_ident1);
  EEPROM.write(1, EE_ident2);
  EEPROM.put(4, steerSettings);
  EEPROM.commit();
}
//--------------------------------------------------------------
void EEprom_read_all(){
    EEPROM.get(4, steerSettings); 
}
//--------------------------------------------------------------
void EEprom_show_memory(){
byte c2=0, data_;
int len = sizeof(steerSettings);
  Serial.print("Reading ");
  Serial.print(len);
  Serial.println(" bytes from Flash . Values are:");
  for (int i = 0; i < len; i++)
  { 
    data_=byte(EEPROM.read(i));
    if (data_ < 0x10) Serial.print("0");
    Serial.print(data_,HEX); 
    if (c2>=15) {
       Serial.println();
       c2=-1;
      }
    else Serial.print(" ");
    c2++;
  }
}




   
