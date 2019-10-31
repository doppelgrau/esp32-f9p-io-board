void calcSteeringPID(void) 
 {
  //Serial.print("steerAngleError");
  //Serial.println(steerAngleError);
  //Proportional
  pValue = steerSettings.Kp * steerAngleError *steerSettings.Ko;  

 /* //Derivative
  dError = steerAngleError - lastLastError;
  dValue = steerSettings.Kd * (dError) * steerSettings.Ko;
  
  //save history of errors
  lastLastError = lastError;
  lastError = steerAngleError;
 */
  
 
  drive = pValue;// + dValue;
  pwmDrive = (constrain(drive, -255, 255));


  //add throttle factor so no delay from motor resistance.
  if (pwmDrive < 0 ) pwmDrive -= steerSettings.minPWMValue;
  else if (pwmDrive > 0 ) pwmDrive += steerSettings.minPWMValue;
  
 if (pwmDrive > 255) pwmDrive = 255;
 if (pwmDrive < -255) pwmDrive = -255;

 }
//---------------------------------------------------------------------
// select output Driver
//---------------------------------------------------------------------
void motorDrive(void) 
{
  switch (steerSettings.output_type) {
    case 1:
      motorDrive_Cytron();
      break;
    case 2:
      motorDrive_IBT_Mot();
      break;
    case 3:
      motorDrive_IBT_PWM();
      break;
    case 4:
      motorDrive_IBT_Danfoss();
      break;
    case 5:
      motorDrive_VNH();
      break;
    default:
      // if nothing else matches no Output
    break;
  }
}
 
//---------------------------------------------------------------------
// Used with Cytron MD30C Driver
// Steering Motor
// Dir + PWM Signal
//---------------------------------------------------------------------
void motorDrive_Cytron(void) 
  {    
    pwmDisplay = pwmDrive;
    if (pwmDrive >= 0) ledcWrite(1, 255);  // channel 1 = VNH_B_PWM  //set the correct direction
    else   
    {
      ledcWrite(1, 0);  // channel 1 = VNH_B_PWM 
      pwmDrive = -1 * pwmDrive;  
   }
    ledcWrite(0, pwmDrive);  // channel 0 = VNH_A_PWM
  }


//---------------------------------------------------------------------
// Used with IBT 2  Driver
// Steering Motor
// PWM Left + PWM Right Signal
// Same Code as the PWM Valve
//---------------------------------------------------------------------
void motorDrive_IBT_Mot(void) 
  {   
   if (steerEnable == false) pwmDrive=0;
   
    pwmDisplay = pwmDrive; 
  
  if (pwmDrive > 0)
    {
      ledcWrite(0, pwmDrive);  // channel 0 = VNH_A_PWM
      ledcWrite(1, 0);
      //digitalWrite(VNH_B_PWM, LOW);
    }
    
  if (pwmDrive <= 0)
    {
      pwmDrive = -1 * pwmDrive;  
      ledcWrite(1, pwmDrive);  // channel 1 = VNH_B_PWM
      ledcWrite(0, 0);
      //digitalWrite(VNH_A_PWM, LOW);
    } 
  }

//---------------------------------------------------------------------
// Used with 2-Coil PWM Valves 
// No coil powered = Center
// Coil 1 steer right connected to VNH_A_PWM 11
// Coil 2 steer left  connected to VNH_B_PWM 10
//---------------------------------------------------------------------
void motorDrive_IBT_PWM(void)
 { 
  if (steerEnable == false) pwmDrive=0;
   
  pwmDisplay = pwmDrive; 

  if (pwmDrive > 0)
    {
      ledcWrite(0, pwmDrive);  // channel 0 = VNH_A_PWM
      ledcWrite(1, 0);
      //digitalWrite(VNH_B_PWM, LOW);
    }
    
  if (pwmDrive <= 0)
    {
      pwmDrive = -1 * pwmDrive;  
      ledcWrite(1, pwmDrive);  // channel 1 = VNH_B_PWM
      ledcWrite(0, 0);
      //digitalWrite(VNH_A_PWM, LOW);
    }
 }  

//---------------------------------------------------------------------
// Danfoss: PWM 25% On = Left Position max  (below Valve=Center)
// Danfoss: PWM 50% On = Center Position
// Danfoss: PWM 75% On = Right Position max (above Valve=Center)
//---------------------------------------------------------------------
void motorDrive_IBT_Danfoss(void) 
  { 
    if (pwmDrive >  250) pwmDrive =  250; 
    if (pwmDrive < -250) pwmDrive = -250;
  
 /* if (steerEnable) digitalWrite(VNH_B_PWM, HIGH); // turn on /off Power
  else 
    {
      digitalWrite(VNH_B_PWM, LOW);  
      pwmDrive=0;
    }*/
  if (steerEnable) ledcWrite(1, 255);  // channel 1 = VNH_B_PWM // turn on /off Power
  else 
    {
      ledcWrite(1, 0);
      pwmDrive=0;
    }
   

    pwmDrive = pwmDrive / 4;  
    pwmOut = pwmDrive+ 128;  // add Center Pos.
    pwmDisplay = pwmOut;
    ledcWrite(0, pwmOut);  // channel 0 = VNH_A_PWM
  }
//---------------------------------------------------------------------
// VNH7070

//---------------------------------------------------------------------
void motorDrive_VNH(void) 
  { 
  {   
   //if (steerEnable == false) pwmDrive=0;
    Serial.print("PWM");
    Serial.println(pwmDrive);
    pwmDisplay = pwmDrive; 

  if (pwmDrive > 0)
    {
      ledcWrite(0, pwmDrive);  // channel 0 = VNH_A_PWM
      setByteI2C(0x43, 0x05, 0b01000000); //out A
    }
    
  if (pwmDrive <= 0)
    {
      pwmDrive = -1 * pwmDrive;  
      ledcWrite(0, pwmDrive);  // channel 1 = VNH_B_PWM
      setByteI2C(0x43, 0x05, 0b10000000); //outB
    } 
  }
  }
 
