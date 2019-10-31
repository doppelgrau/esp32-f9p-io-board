// all about Network

#include <WiFi.h>
#include <AsyncUDP.h>

#include <WiFiAP.h>
#include <WiFiClient.h>

//Declarations
void WiFi_Start_STA(void);


// Wifi variables & definitions
#define MAX_PACKAGE_SIZE 2048
char HTML_String[8000];
char HTTP_Header[150];

byte my_WiFi_Mode = 0;  // WIFI_STA = 1 = Workstation  WIFI_AP = 2  = Accesspoint
//---------------------------------------------------------------------
// Allgemeine Variablen

int Aufruf_Zaehler = 0;

#define ACTION_SET_SSID        1  
#define ACTION_SET_OUTPUT_TYPE 2  // also adress at EEPROM
#define ACTION_SET_WAS_TYPE    3
#define ACTION_SET_WAS_ZERO    4
#define ACTION_SET_WAS_INVERT  5
#define ACTION_SET_IMU_TYPE    6
#define ACTION_SET_INCLINO     7
#define ACTION_SET_INCL_ZERO   8
#define ACTION_SET_ENCODER     9
#define ACTION_SET_SWITCHES    10
#define ACTION_SET_THRESHOLD   11

int action;

// Radiobutton output
char output_driver_tab[6][22] = {"None", "Cytron MD30 + SWM", "IBT_2 +SWM", "IBT_2 +PWM Valve", "IBT_2 +Danfoss Valve","NVH7070"};

// Radiobutton analog input
char was_input_tab[4][33] = {"Arduino/ESP direct", "ADS 1115 single", "ADS 1115 diff A1-GND A2-Signal","ADS 1115 diff A3-5v A2-Singal"};

// Radiobutton WAS Invert
char was_invert_tab[2][15] = {"not inverted", "inverted"};

// Radiobutton IMU Heading Unit
char imu_type_tab[2][10] = {"NoHeading", "BNO 055"};

// Radiobutton Inclinometer
char inclino_type_tab[2][10] = {"None", "LSM9D/MMA"};

// Radiobutton Steerswitch
char steersw_type_tab[5][23] = {"Switch High(pulldown)", "Switch Low", "Toggle Button", "Analog Buttons",""};

// Radiobutton Workswitch
char worksw_type_tab[4][18] = {"None", "Digital(pulldown)", "Analog", ""};

// Radiobutton WorkSwitch Invert
char worksw_invert_tab[2][15] = {"not inverted", "inverted"};

// Radiobutton Encoder
char encoder_type_tab[2][11] = {"None", "Installed"};

char tmp_string[20];
//---------------------------------------------------------------------
