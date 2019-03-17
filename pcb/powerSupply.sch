EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title "Power supply"
Date "2019-01-19"
Rev "0.1"
Comp ""
Comment1 "With protection against reverse polarity"
Comment2 "With inrush reduction"
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 900  1000 0    50   Input ~ 0
V_In_12V
Text HLabel 750  2750 0    50   BiDi ~ 0
GND
Text HLabel 11100 900  0    50   Output ~ 0
V_Out_12V
Text HLabel 11100 2150 0    50   Output ~ 0
V_Out_5V
Text HLabel 11100 3650 0    50   Output ~ 0
V_Out_3.3V
$Comp
L Relay:G5LE-1 K1
U 1 1 5C429E5C
P 1950 1850
F 0 "K1" V 2517 1850 50  0000 C CNN
F 1 "G5LE-1" V 2426 1850 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5LE-1" H 2400 1800 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 1950 1450 50  0001 C CNN
	1    1950 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5C429F3B
P 1950 1100
F 0 "R6" V 1743 1100 50  0000 C CNN
F 1 "24" V 1834 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1880 1100 50  0001 C CNN
F 3 "~" H 1950 1100 50  0001 C CNN
	1    1950 1100
	0    1    1    0   
$EndComp
NoConn ~ 1650 1750
Wire Wire Line
	900  1000 1650 1000
Wire Wire Line
	2250 1650 3000 1650
Wire Wire Line
	3000 2750 1650 2750
Connection ~ 1650 2750
Wire Wire Line
	1650 2750 750  2750
$Comp
L Device:D D3
U 1 1 5C42A2E9
P 2450 1000
F 0 "D3" H 2450 784 50  0000 C CNN
F 1 "SD0805S020S1R0" H 2450 875 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 1000 50  0001 C CNN
F 3 "~" H 2450 1000 50  0001 C CNN
	1    2450 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 1000 3000 1000
Wire Wire Line
	3000 1000 3000 1650
Connection ~ 3000 1650
Wire Wire Line
	3000 1000 5050 1000
Wire Wire Line
	11100 1000 11100 900 
Connection ~ 3000 1000
Wire Wire Line
	1650 2050 1650 2750
Wire Wire Line
	1650 1550 1650 1000
Wire Wire Line
	3000 1650 3000 2050
$Comp
L Regulator_Linear:AZ1117-5.0 U2
U 1 1 5C42B615
P 5850 1500
F 0 "U2" H 5850 1742 50  0000 C CNN
F 1 "AZ1117-5.0" H 5850 1651 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 5850 1750 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 5850 1500 50  0001 C CNN
	1    5850 1500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AZ1117-3.3 U3
U 1 1 5C42B874
P 9750 3050
F 0 "U3" H 9750 3292 50  0000 C CNN
F 1 "AZ1117-3.3" H 9750 3201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9750 3300 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 9750 3050 50  0001 C CNN
	1    9750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3050 9150 3050
Wire Wire Line
	5550 1500 5300 1500
Wire Wire Line
	3000 3350 3000 2750
Connection ~ 5050 1000
Wire Wire Line
	5050 1000 11100 1000
$Comp
L Device:C C8
U 1 1 5C42CCEE
P 5300 1650
F 0 "C8" H 5415 1696 50  0000 L CNN
F 1 "10u" H 5415 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5338 1500 50  0001 C CNN
F 3 "~" H 5300 1650 50  0001 C CNN
	1    5300 1650
	1    0    0    -1  
$EndComp
Connection ~ 5300 1500
Wire Wire Line
	5300 1500 5050 1500
Connection ~ 5300 1800
Wire Wire Line
	5300 1800 4750 1800
$Comp
L Device:C C6
U 1 1 5C42CDBC
P 9150 3200
F 0 "C6" H 9265 3246 50  0000 L CNN
F 1 "10u" H 9265 3155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9188 3050 50  0001 C CNN
F 3 "~" H 9150 3200 50  0001 C CNN
	1    9150 3200
	1    0    0    -1  
$EndComp
Connection ~ 9150 3050
Connection ~ 9150 3350
$Comp
L Device:C C9
U 1 1 5C42CF34
P 6300 1650
F 0 "C9" H 6415 1696 50  0000 L CNN
F 1 "22u" H 6415 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6338 1500 50  0001 C CNN
F 3 "~" H 6300 1650 50  0001 C CNN
	1    6300 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5C42D112
P 3000 2350
F 0 "C5" H 3118 2396 50  0000 L CNN
F 1 "2200u" H 3118 2305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D14.0mm_P5.00mm" H 3038 2200 50  0001 C CNN
F 3 "~" H 3000 2350 50  0001 C CNN
	1    3000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2050 3000 2200
Connection ~ 3000 2050
Wire Wire Line
	3000 2500 3000 2750
Connection ~ 3000 2750
Wire Wire Line
	5850 1800 6300 1800
Wire Wire Line
	6150 1500 6300 1500
Wire Wire Line
	6300 1500 11100 1500
Wire Wire Line
	11100 1500 11100 2150
Connection ~ 6300 1500
Wire Wire Line
	11100 3050 11100 3650
Connection ~ 5850 1800
Wire Wire Line
	5300 1800 5850 1800
Connection ~ 9750 3350
Wire Wire Line
	9150 3350 9750 3350
Wire Wire Line
	2250 2050 3000 2050
Wire Wire Line
	4750 3350 3000 3350
Wire Wire Line
	10600 3050 11100 3050
Connection ~ 10600 3050
$Comp
L Device:C C7
U 1 1 5C60E376
P 10600 3200
F 0 "C7" H 10715 3246 50  0000 L CNN
F 1 "22u" H 10715 3155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10638 3050 50  0001 C CNN
F 3 "~" H 10600 3200 50  0001 C CNN
	1    10600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1800 4750 2450
Connection ~ 5050 1500
Wire Wire Line
	5050 1500 5050 2150
Wire Wire Line
	5050 1500 5050 1000
$Comp
L Regulator_Linear:AZ1117-5.0 U4
U 1 1 5C4F6AA6
P 5850 2150
F 0 "U4" H 5850 2392 50  0000 C CNN
F 1 "AZ1117-5.0" H 5850 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 5850 2400 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 5850 2150 50  0001 C CNN
	1    5850 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5C4F6B16
P 6350 2300
F 0 "C16" H 6465 2346 50  0000 L CNN
F 1 "22u" H 6465 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6388 2150 50  0001 C CNN
F 3 "~" H 6350 2300 50  0001 C CNN
	1    6350 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5C4F6BA2
P 5300 2300
F 0 "C12" H 5415 2346 50  0000 L CNN
F 1 "10u" H 5415 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5338 2150 50  0001 C CNN
F 3 "~" H 5300 2300 50  0001 C CNN
	1    5300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11100 2150 8900 2150
Wire Wire Line
	6150 2150 6350 2150
Connection ~ 6350 2150
Wire Wire Line
	5550 2150 5300 2150
Wire Wire Line
	5300 2150 5050 2150
Connection ~ 5300 2150
Wire Wire Line
	8900 2150 8900 3050
Wire Wire Line
	8900 3050 9150 3050
Connection ~ 8900 2150
Wire Wire Line
	8900 2150 6350 2150
Wire Wire Line
	4750 3350 9150 3350
Connection ~ 4750 3350
Wire Wire Line
	6350 2450 5850 2450
Connection ~ 4750 2450
Wire Wire Line
	4750 2450 4750 3350
Connection ~ 5300 2450
Wire Wire Line
	5300 2450 4750 2450
Connection ~ 5850 2450
Wire Wire Line
	5850 2450 5300 2450
Wire Wire Line
	10050 3050 10600 3050
Wire Wire Line
	9750 3350 10600 3350
$Comp
L Device:R R22
U 1 1 5C4F6C9F
P 1950 750
F 0 "R22" V 1743 750 50  0000 C CNN
F 1 "24" V 1834 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1880 750 50  0001 C CNN
F 3 "~" H 1950 750 50  0001 C CNN
	1    1950 750 
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 1000 1800 1000
Wire Wire Line
	1800 1000 1800 1100
Connection ~ 1650 1000
Wire Wire Line
	1800 1000 1800 750 
Connection ~ 1800 1000
Wire Wire Line
	2300 1000 2100 1000
Wire Wire Line
	2100 1000 2100 750 
Wire Wire Line
	2100 1000 2100 1100
Connection ~ 2100 1000
$EndSCHEMATC
