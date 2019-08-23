EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 17
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 10950 4650 2    50   BiDi ~ 0
GND
Text HLabel 10950 3400 2    50   BiDi ~ 0
SDA
Text HLabel 10950 3300 2    50   Input ~ 0
SCL
Text HLabel 10950 2050 2    50   Input ~ 0
5V
Wire Wire Line
	6400 3700 6400 4650
Wire Wire Line
	6400 4650 7550 4650
Text HLabel 10950 4200 2    50   Input ~ 0
Addr
Wire Wire Line
	6800 4200 6800 3500
$Comp
L Device:C C19
U 1 1 5C558E00
P 7550 2200
F 0 "C19" H 7665 2246 50  0000 L CNN
F 1 "100n" H 7665 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7588 2050 50  0001 C CNN
F 3 "~" H 7550 2200 50  0001 C CNN
	1    7550 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2050 6400 2800
Wire Wire Line
	7550 2350 7550 4650
$Comp
L Analog_ADC:ADS1115IDGS U4
U 1 1 5C55ACA7
P 6400 3300
F 0 "U4" H 6400 3978 50  0000 C CNN
F 1 "ADS1115IDGS" H 6400 3887 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 6400 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 6350 2400 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
NoConn ~ 6800 3100
$Comp
L Device:R R24
U 1 1 5C56603C
P 4150 3000
F 0 "R24" V 3943 3000 50  0000 C CNN
F 1 "47k" V 4034 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4080 3000 50  0001 C CNN
F 3 "~" H 4150 3000 50  0001 C CNN
	1    4150 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 5C5660E7
P 3250 3200
F 0 "R23" V 3043 3200 50  0000 C CNN
F 1 "47k" V 3134 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3180 3200 50  0001 C CNN
F 3 "~" H 3250 3200 50  0001 C CNN
	1    3250 3200
	0    1    1    0   
$EndComp
$Comp
L Device:C C17
U 1 1 5C56618F
P 4400 3850
F 0 "C17" H 4515 3896 50  0000 L CNN
F 1 "1n" H 4515 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4438 3700 50  0001 C CNN
F 3 "~" H 4400 3850 50  0001 C CNN
	1    4400 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5C566227
P 4900 3850
F 0 "C18" H 5015 3896 50  0000 L CNN
F 1 "1n" H 5015 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4938 3700 50  0001 C CNN
F 3 "~" H 4900 3850 50  0001 C CNN
	1    4900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4650 4400 4000
Connection ~ 6400 4650
Wire Wire Line
	4900 4000 4900 4650
Wire Wire Line
	4400 4650 4900 4650
Connection ~ 4900 4650
Wire Wire Line
	6400 2050 7550 2050
Wire Wire Line
	7550 2050 8100 2050
Connection ~ 7550 2050
$Comp
L Device:C C20
U 1 1 5CA415B4
P 8100 2200
F 0 "C20" H 8215 2246 50  0000 L CNN
F 1 "22u" H 8215 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8138 2050 50  0001 C CNN
F 3 "~" H 8100 2200 50  0001 C CNN
	1    8100 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2350 7550 2350
Connection ~ 7550 2350
$Comp
L Device:R R2
U 1 1 5CA41C10
P 8800 2050
F 0 "R2" V 8990 2050 50  0000 C CNN
F 1 "24" V 8899 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8800 2050 50  0001 C CNN
F 3 "~" H 8800 2050 50  0001 C CNN
	1    8800 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8100 2050 8650 2050
Connection ~ 8100 2050
Wire Wire Line
	8950 2050 10950 2050
Wire Wire Line
	6800 3300 10950 3300
Wire Wire Line
	6800 3400 10950 3400
Wire Wire Line
	6800 4200 10950 4200
$Comp
L Device:R R25
U 1 1 5CA430FD
P 5400 2050
F 0 "R25" V 5193 2050 50  0000 C CNN
F 1 "120" V 5284 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 2050 50  0001 C CNN
F 3 "~" H 5400 2050 50  0001 C CNN
	1    5400 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 2050 5550 2050
Connection ~ 6400 2050
Connection ~ 4400 4650
Wire Wire Line
	7550 4650 10950 4650
Connection ~ 7550 4650
Wire Wire Line
	4900 4650 6400 4650
$Comp
L Device:C C16
U 1 1 5CCCE578
P 3900 3850
F 0 "C16" H 4015 3896 50  0000 L CNN
F 1 "1n" H 4015 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3938 3700 50  0001 C CNN
F 3 "~" H 3900 3850 50  0001 C CNN
	1    3900 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 5CCCEF84
P 2350 3400
F 0 "R22" V 2143 3400 50  0000 C CNN
F 1 "47k" V 2234 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2280 3400 50  0001 C CNN
F 3 "~" H 2350 3400 50  0001 C CNN
	1    2350 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2050 5200 3500
Wire Wire Line
	5200 3500 6000 3500
Connection ~ 5200 2050
Wire Wire Line
	5200 2050 5250 2050
Wire Wire Line
	6000 3400 3900 3400
Wire Wire Line
	6000 3300 4400 3300
Wire Wire Line
	3400 3300 3400 3200
Wire Wire Line
	4300 3000 4300 3200
Wire Wire Line
	4300 3200 4900 3200
Wire Wire Line
	3900 4000 3900 4650
Connection ~ 3900 4650
Wire Wire Line
	3900 4650 4400 4650
Wire Wire Line
	3900 3700 3900 3400
Connection ~ 3900 3400
Wire Wire Line
	3900 3400 2500 3400
Wire Wire Line
	4400 3700 4400 3300
Connection ~ 4400 3300
Wire Wire Line
	4400 3300 3400 3300
Wire Wire Line
	4900 3700 4900 3200
Connection ~ 4900 3200
Wire Wire Line
	4900 3200 6000 3200
$Comp
L Connector_own:PTSM-Header-Horizontal-5 J5
U 1 1 5CCCDB32
P 1250 3300
F 0 "J5" H 1250 3665 50  0000 C CNN
F 1 "PTSM-Header-Horizontal-5" H 1250 3574 50  0000 C CNN
F 2 "Connector_own:1814870" H 750 2800 50  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Phoenix%20Contact%20PDFs/1814870.pdf" H 750 3000 50  0001 L CNN
F 4 "Phoenix Contact PTSM Series, 2.5mm Pitch 5 Way 1 Row Right Angle PCB Terminal Block, Solder Termination, 6A" H 750 2900 50  0001 L CNN "Description"
F 5 "5" H 750 2300 50  0001 L CNN "Height"
F 6 "651-1814870" H 750 2700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1814870" H 750 2400 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 750 2600 50  0001 L CNN "Manufacturer_Name"
F 9 "1814870" H 750 2500 50  0001 L CNN "Manufacturer_Part_Number"
	1    1250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3000 850  3200
Wire Wire Line
	1650 3200 3100 3200
Wire Wire Line
	600  4650 600  3300
Wire Wire Line
	600  3300 850  3300
Wire Wire Line
	600  4650 3900 4650
Wire Wire Line
	1700 2050 1700 3300
Wire Wire Line
	1700 3300 1650 3300
Wire Wire Line
	2200 3400 1650 3400
Wire Wire Line
	1650 3400 1650 3750
Wire Wire Line
	1650 3750 850  3750
Wire Wire Line
	850  3750 850  3400
Wire Wire Line
	1700 2050 5200 2050
Wire Wire Line
	850  3000 4000 3000
$EndSCHEMATC
