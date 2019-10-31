//Core1:  Autosteer Code

void Core1code( void * pvParameters ){
  Serial.println();
  Serial.print("Task1 running on core ");
  Serial.println(xPortGetCoreID());

#if (useOLED_Display)
  display_start();  // Greetings
#endif


while ((my_WiFi_Mode == 0)){   // Waiting for WiFi Access
   //Serial.print(my_WiFi_Mode);
   Serial.println(" Waiting for WiFi Access\n");
   delay(4000);
 }
if (my_WiFi_Mode == WIFI_STA) Serial.println("connection to WiFi Network established");
if (my_WiFi_Mode == WIFI_AP)  Serial.println("WiFi Accesspoint now started");

Serial.print("gain of ADS1115: ");
Serial.println(ads.getGain());
 
  for(;;){ // MAIN LOOP FOR THIS CORE
    
  //* Loop triggers every 100 msec and sends back gyro heading, and roll, steer angle etc
  currentTime = millis();
  unsigned int time = currentTime;
  
  if (currentTime - lastTime >= LOOP_TIME)
  {
    dT = currentTime - lastTime;
    lastTime = currentTime;
   
 if (steerSettings.IMU_type ==1){   // Initialize the BNO055 if not done
   if (imu_initialized==0){
     initBNO055(); 
     imu_initialized=1;
    }
    readEulData(EulCount);  // Read the x/y/z adc values   
    // Calculate the Euler angles values in degrees
    Head = (float)EulCount[0];
    Yaw = Head/16.;  
  }

   //If connection lost to AgOpenGPS, the watchdog will count up and turn off steering
    if (watchdogTimer++ > 250) watchdogTimer = 20;

 if (steerSettings.Inclino_type ==1){
   // MMA8452 (1) Inclinometer
   if (accelerometer.acc_initialized==0){
    if(!accelerometer.init()) steerSettings.Inclino_type = 0;} // Try to Initialize MMA8452
   accelerometer.getRawData(&x_, &y_, &z_);
   roll=x_; //Conversion uint to int
   if (roll > 8500)  roll =  8500;
   if (roll < -8500) roll = -8500;
   roll -= steerSettings.roll_corr;  // 
   rollK = map(roll,-8500,8500,-480,480); //16 counts per degree (good for 0 - +/-30 degrees) 
  }

 if (steerSettings.Inclino_type ==2){
   // LSM9DS1 (2) Inclinometer
   imu.begin();
   if ( imu.gyroAvailable() )imu.readGyro();
   if ( imu.accelAvailable() )imu.readAccel();
   //if ( imu.magAvailable() ) imu.readMag();
   float degroll = atan2(imu.ay, imu.az);
   degroll  *= 2880.0 / PI; //180*16=2880  16 counts per degree (good for 0 - +/-30 degrees) 
   //Serial.println(degroll, 4);
   degroll -= steerSettings.roll_corr;  // 
   rollK = int(degroll); //int 
 
 //16 counts per degree (good for 0 - +/-30 degrees) 
  }
 //Kalman filter
    Pc = P + varProcess;
    G = Pc / (Pc + varRoll);
    P = (1 - G) * Pc;
    Xp = XeRoll;
    Zp = Xp;
    XeRoll = G * (rollK - Zp) + Xp;

    switch (steerSettings.WorkSW_mode)
  {
  case 1:
    if (steerSettings.Invert_WorkSW == 0) workSwitch = digitalRead(WORKSW_PIN);    // read digital work switch
    if (steerSettings.Invert_WorkSW == 1) workSwitch = !digitalRead(WORKSW_PIN);    // read digital work switch
    break;
  case 2:
    AnalogValue = analogRead(WORKSW_PIN);
    delay(1);
    AnalogValue += analogRead(WORKSW_PIN);
    delay(1);
    AnalogValue += analogRead(WORKSW_PIN);
    delay(1);
    AnalogValue += analogRead(WORKSW_PIN);
    AnalogValue = AnalogValue >> 2;
    if (steerSettings.Invert_WorkSW == 0){
      if (AnalogValue < steerSettings.WorkSW_Threshold)   workSwitch = 1;
      else workSwitch = 0;
     }
    
    if (steerSettings.Invert_WorkSW == 1){
      if (AnalogValue > steerSettings.WorkSW_Threshold)   workSwitch = 1;
      else workSwitch = 0; 
     }
    break;
  }
  
  if (workSwitch != workSwitchOld) {
    if (workSwitch > 0) {
      Serial.println("workswitch: ON");
      workSwitchOld = workSwitch;
    }
    else {
      Serial.println("workSwitch: OFF");
      workSwitchOld = workSwitch;
    }
  }

    state_previous=steerEnable;    // Debug only
    if (pulseACount + pulseBCount >= steerSettings.pulseCountMax && pulseACount >0 && pulseBCount >0 && steerSettings.SWEncoder ){
       steerEnable=false;
       //watchdogTimer = 20;  // turn off steering
      }
if (steerEnable != state_previous) Serial.println("Steer-Break: Encoder.."); // Debug only
    steerSwitch = steerEnable;  //digitalRead(STEERSW_PIN); //read auto steer enable switch open = 0n closed = Off
    steerSwitch <<= 1; //put steerswitch status in bit 1 position
    switchByte = workSwitch | steerSwitch;

    SetRelays(); //turn on off sections

//steering position and steer angle
  switch (steerSettings.input_type) {
    case 1:  // ADS 1115 single
      steeringPosition = ads.readADC_SingleEnded(0);    delay(1);           //ADS1115 Standard Mode
      steeringPosition += ads.readADC_SingleEnded(0);    delay(1);
      steeringPosition += ads.readADC_SingleEnded(0);    delay(1);
      steeringPosition += ads.readADC_SingleEnded(0);     
      break;
    case 2:  // ADS 1115 differential
      steeringPosition = ads.readADC_Differential_0_1();    delay(1);    //ADS1115 Differential Mode 
      steeringPosition += ads.readADC_Differential_0_1();   delay(1);    //Connect Sensor GND to A1
      steeringPosition += ads.readADC_Differential_0_1();   delay(1);    //Connect Sensor Signal to A0
      steeringPosition += ads.readADC_Differential_0_1();
      break;
    case 3:  // ADS 1115 differential A3-5v A2-Singal
      steeringPosition = ads.readADC_Differential_2_3();    delay(1);    //ADS1115 Differential Mode 
      steeringPosition += ads.readADC_Differential_2_3();   delay(1);    //Connect Sensor 5V to A3
      steeringPosition += ads.readADC_Differential_2_3();   delay(1);    //Connect Sensor Signal to A2
      steeringPosition += ads.readADC_Differential_2_3();
      break;
   default: // directly to arduino
      steeringPosition = analogRead(W_A_S);    delay(1);
      steeringPosition += analogRead(W_A_S);    delay(1);
      steeringPosition += analogRead(W_A_S);    delay(1);
      steeringPosition += analogRead(W_A_S);
      break;

  }
    steeringPosition = steeringPosition >> 2; //divide by 4
    if (steerSettings.input_type == 3){ //map Raw to -45 +45degree
      steeringPosition = map(steeringPosition,steeringPositionRawMim,steeringPositionRawMax,-4500,4500);
    }
    actualSteerPos=steeringPosition; // stored for >zero< Funktion
    steeringPosition = ( steeringPosition -steerSettings.steeringPositionZero);   //center the steering position sensor  
    
    //invert position, left must be minus
    if (steerSettings.Invert_WAS) steeringPosition_corr = - steeringPosition;
    else steeringPosition_corr = steeringPosition;
    //convert position to steer angle
    steerAngleActual = (float)(steeringPosition_corr) /   steerSettings.steerSensorCounts; 

 if (steerSettings.Inclino_type > 0 ) steerAngleActual = steerAngleActual - (XeRoll * (steerSettings.Kd/800));     // add the roll
 else XeRoll=0;

   //close enough to center, remove any correction
   //if (distanceFromLine < 40 && distanceFromLine  -40) steerAngleSetPoint = 0;
   if (distanceFromLine <= 40 && distanceFromLine >= -40) corr = 0;
   else
    {
      //use the integal value to adjust how much per cycle it increases
      corr += steerSettings.Ki;

      //provide a limit - the old max integral value
      if (corr > maxIntegralValue) corr = maxIntegralValue;

      //now add the correction to fool steering position
      if (distanceFromLine > 40)
        {
         steerAngleSetPoint -= corr;
        }
      else
        {
         steerAngleSetPoint += corr;
        }
    }
 
 //Build Autosteer Packet: Send to agopenGPS **** you must send 10 Byte or 5 Int
  
 int temp;
    //actual steer angle
    temp = (100 * steerAngleActual);
    toSend[2] = (byte)(temp >> 8);
    toSend[3] = (byte)(temp);

    //imu heading --- * 16 in degrees
    temp = Head;
    toSend[4] = (byte)(temp >> 8);
    toSend[5] = (byte)(temp);

   //Vehicle roll --- * 16 in degrees
   temp = XeRoll;
   toSend[6] = (byte)(temp >> 8);
   toSend[7] = (byte)(temp);

    //switch byte
    toSend[8] = switchByte;

//Build Autosteer Packet completed
Send_UDP();  //transmit to AOG

//debug Prints
   //Send to agopenGPS **** you must send 5 numbers ****
   //Serial.print(steerAngleActual); //The actual steering angle in degrees
   //Serial.print(",");
   //Serial.print(switchByte); //The actual steering angle in counts
   //Serial.print(",");
   //Serial.print(XeRoll/16);   //the pwm value to solenoids or motor
   //Serial.print(",");
   // Serial.print(IMU.euler.head/16);   //the pwm value to solenoids or motor
   //Serial.println("");

#if (useOLED_Display)
    display.clear();
    //display_steer_units();
    //display_encoder_units();
    draw_Sensor();
    display.display();
#endif
  
  }  // End of timed loop ------ 
  //delay(10);

  switch (steerSettings.SteerSwitchType)
  { 
  case 0: 
    steerEnable = digitalRead(STEERSW_PIN);
    Serial.println(steerEnable);
    break;
  case 1:
    steerEnable = !digitalRead(STEERSW_PIN);
    break;
  case 3:
    byte tempvalue = analogRead(STEERSW_PIN);
    if (tempvalue < 800) { steerEnable = false; }
    if (tempvalue > 3200) { steerEnable = true; }
    break;
  } 
  //Serial.println(steerAngleSetPoint);
  if (watchdogTimer < 18 )
    {   

      steerAngleError = steerAngleActual - steerAngleSetPoint;   //calculate the steering error 
      calcSteeringPID();   //do the pid     
      motorDrive();       //out to motors the pwm value     
    }
  else
    {
      //we've lost the comm to AgOpenGPS
      state_previous=steerEnable;   // Debug only
      steerEnable= false;
        if (steerEnable != state_previous) Serial.println("Steer-Break: WDT runs out");    // Debug only
      pwmDrive = 0; //turn off steering motor
      motorDrive(); //out to motors the pwm value   
      pulseACount = pulseBCount =0; //Reset counters if Autosteer is offline    
    }
  if (toggleSteerEnable==1)
    {
      steerEnable = !steerEnable;
      Serial.println("Steer-Break: IRQ occured? Button pressed?");  // Debug only
      toggleSteerEnable=0;
      if (steerEnable) watchdogTimer = 0;
    }

} // End of (main core1)
} // End of core1code


// Subs --------------------------------------
// recv from AOG steerAngleSetPoint 
void udpSteerRecv()
{ //callback when received packets
Serial.println("<--");    
  udp.onPacket([](AsyncUDPPacket packet) 
   {
      for (int i = 0; i < 10; i++) 
        {
          data[i]=packet.data()[i];
        }

      if (data[0] == 0x7F && data[1] == 0xFE) //Data Packet
        {
               //Serial.print(millis()-oldmillis);  //benchmark
               //oldmillis=millis(); 
               //Serial.println("<--");    
     
          
         relay = data[2];   // read relay control from AgOpenGPS     
         speeed = data[3] >> 2;  //actual speed times 4, single byte
  
         //distance from the guidance line in mm
         olddist = distanceFromLine;
         idistanceFromLine = (data[4] << 8 | data[5]);   //high,low bytes     
         distanceFromLine = (float)idistanceFromLine;
  
         //set point steer angle * 10 is sent
         isteerAngleSetPoint = ((data[6] << 8 | data[7])); //high low bytes 
         steerAngleSetPoint = (float)isteerAngleSetPoint * 0.01;  


        //auto Steer is off if 32020,Speed is too slow, Wheelencoder above Max
        if (distanceFromLine == 32020 | speeed < 1 | (pulseACount+pulseBCount >= steerSettings.pulseCountMax && pulseACount>0 && pulseBCount>0))
          { 
            state_previous=steerEnable;    // Debug only
            steerEnable=false;
            if (steerEnable != state_previous) Serial.println("Steer-Break:  AOG,Speed or Encoder.."); // Debug only
            
            watchdogTimer = 20;//turn off steering motor
            digitalWrite(Autosteer_Led, LOW); //turn LED off
            //led_off();
          }
         else          //valid conditions to turn on autosteer
          {
            if (olddist == 32020)  steerEnable = true;              // Take over AOG State on startup

            if (steerEnable == true)
              {
                digitalWrite(Autosteer_Led, HIGH);  //turn LED on 
                //led_on();
                watchdogTimer = 0;  //reset watchdog 
              }
            else
              {
                digitalWrite(Autosteer_Led, LOW);  //turn LED off 
                //led_off();
                watchdogTimer = 20;  // turn off steering
              }
          }
   
      //steerEnable=true;    //debug
       /*
      Serial.print(steerAngleActual);   //the pwm value to solenoids or motor
      Serial.print(",");
      Serial.println(XeRoll);
      */
      UDP_data_time = millis();
       }

    //autosteer settings packet
    if (data[0] == 0x7F && data[1] == 0xFC)
     {
      steerSettings.Kp = (float)data[2] * 1.0;   // read Kp from AgOpenGPS
      steerSettings.Ki = (float)data[3] * 0.001;   // read Ki from AgOpenGPS
      steerSettings.Kd = (float)data[4] * 1.0;   // read Kd from AgOpenGPS
      steerSettings.Ko = (float)data[5] * 0.1;   // read Ko from AgOpenGPS
      if (steerSettings.input_type == 3){ //map Raw to -45 +45degree
       steerSettings.steeringPositionZero = (steerSettings.SteerPosZero) + data[6];//read steering zero offset  
      }else{
      steerSettings.steeringPositionZero = (steerSettings.SteerPosZero-127) + data[6];//read steering zero offset  
      }
      steerSettings.minPWMValue = data[7]; //read the minimum amount of PWM for instant on
      maxIntegralValue = data[8]*0.1; //
      steerSettings.steerSensorCounts = data[9]; //sent as 10 times the setting displayed in AOG
      EEprom_write_all();
      
      for (int i = 0; i < 10; i++) 
       {
        
       Serial.print(data[i],HEX); Serial.print("\t");
       }

       }
   
       });  // end of onPacket call
}
#if (useOLED_Display)
//--------------------------------------------
void draw_Sensor() {
  int progress=0;
  progress = map(steerAngleActual,-130,130,0,100);
 
  // draw the progress bar
  display.drawProgressBar(0, 12, 120, 10, progress);
  display.drawProgressBar(0, 36, 120, 10, XeRoll/16+50);

  // draw the percentage as String
  display.setFont(ArialMT_Plain_10);
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.drawString(64, 0, "WAS:  "+String(progress-50) + "%");
  display.drawString(64, 23, "Roll:  "+String(XeRoll/16) + "°");
  display.setFont(ArialMT_Plain_16);
  display.drawString(64, 46,"Heading: "+ String(Yaw) + "°");
}
//--------------------------------------------
void display_steer_units(){
    
    display.setTextAlignment(TEXT_ALIGN_LEFT);
    display.setFont(ArialMT_Plain_10);
    display.drawString(0, 0, "Angle Act:" +String(steerAngleActual ));
    display.drawString(0, 10,"SetPoint :" +String(steerAngleSetPoint));
    display.drawString(0, 20,"SA_Error :" +String(steerAngleError));
    display.drawString(0, 30,"pValue   :" +String(pValue));
    display.drawString(0, 40,"pwmDrive :" +String(pwmDrive));   
    display.drawString(0, 50,"pwmDrive :" +String(pwmDisplay));
}
//--------------------------------------------
void display_encoder_units(){
    
    display.setTextAlignment(TEXT_ALIGN_LEFT);
    display.setFont(ArialMT_Plain_10);
    display.drawString(0, 0, "Enc_A : " +String(pulseACount));
    display.drawString(0, 10,"Enc_B : " +String(pulseBCount));
    display.drawString(0, 20,"pulsecount: " +String(0));
    display.drawString(0, 30,"pCountMax: " +String(steerSettings.pulseCountMax));
    display.drawString(0, 40,"SteerEnable: " +String(steerEnable));   
    display.drawString(0, 50,"pwmDrive : " +String(pwmDisplay));
}
//--------------------------------------------
void display_start(){
    display.init();
    display.flipScreenVertically();
    display.setFont(ArialMT_Plain_10);
    
    display.clear();
    display.setTextAlignment(TEXT_ALIGN_CENTER);
    display.setFont(ArialMT_Plain_16);
    display.drawString(64, 0, "AG Autosteer");
    display.drawString(64, 18, "thanks to");
    display.drawString(64, 36, "BrianTee");
    display.display();
    delay(2000);
}
#endif
