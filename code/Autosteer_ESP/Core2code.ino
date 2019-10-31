//Core2: this task only serves the Webpage

void Core2code( void * pvParameters ){
  Serial.println();
  Serial.print("Task2 running on core ");
  Serial.println(xPortGetCoreID());

  
// Start WiFi Client
 while (!EE_done){  // wait for eeprom data
  delay(10);
 }
 WiFi_Start_STA();
 if (my_WiFi_Mode == 0) WiFi_Start_AP(); // if failed start AP

 UDP_Start();  // start the UDP Client

  for(;;){
    //digitalWrite(VNH_B_PWM, LOW);
    //digitalWrite(VNH_B_PWM, HIGH);
    //if (!steerEnable) 
    WiFi_Traffic();
    delay(10);  

  //no data for more than 2 secs = blink
  if ((UDP_data_time = 0) | (millis() > (UDP_data_time + 2000))) {
    if (!LED_WIFI_ON) {
      if (millis() > (LED_WIFI_time + LED_WIFI_pause)) {
        LED_WIFI_time = millis();
        LED_WIFI_ON = true;
        //digitalWrite(LED_PIN_WIFI, HIGH);
      }
    }
    if (LED_WIFI_ON) {
      if (millis() > (LED_WIFI_time + LED_WIFI_pulse)) {
        LED_WIFI_time = millis();
        LED_WIFI_ON = false;
        //digitalWrite(LED_PIN_WIFI, LOW);
      }
    }
  }
  //else  digitalWrite(LED_PIN_WIFI, HIGH);

  
  }
}
