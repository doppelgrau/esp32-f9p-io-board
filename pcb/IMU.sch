EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6450 4100 8900 4100
Wire Wire Line
	5850 2400 5750 2400
Wire Wire Line
	5750 2400 5750 2000
Wire Wire Line
	6050 2400 6150 2400
Wire Wire Line
	6150 2400 6150 2300
$Comp
L Device:C C51
U 1 1 5CBA731C
P 6300 2300
F 0 "C51" V 6048 2300 50  0000 C CNN
F 1 "100n" V 6139 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6338 2150 50  0001 C CNN
F 3 "~" H 6300 2300 50  0001 C CNN
	1    6300 2300
	0    1    1    0   
$EndComp
$Comp
L Device:C C50
U 1 1 5CBA73BD
P 6300 1800
F 0 "C50" V 6048 1800 50  0000 C CNN
F 1 "10u" V 6139 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6338 1650 50  0001 C CNN
F 3 "~" H 6300 1800 50  0001 C CNN
	1    6300 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 1250 6150 1250
$Comp
L Device:R R54
U 1 1 5CBA757D
P 6150 1400
F 0 "R54" H 6220 1446 50  0000 L CNN
F 1 "24" H 6220 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6080 1400 50  0001 C CNN
F 3 "~" H 6150 1400 50  0001 C CNN
	1    6150 1400
	1    0    0    -1  
$EndComp
Connection ~ 6150 1250
Wire Wire Line
	6150 1250 7050 1250
Wire Wire Line
	6150 1550 6150 1800
Connection ~ 6150 1800
$Comp
L Device:C C49
U 1 1 5CBA774A
P 5900 2000
F 0 "C49" V 5648 2000 50  0000 C CNN
F 1 "100n" V 5739 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 1850 50  0001 C CNN
F 3 "~" H 5900 2000 50  0001 C CNN
	1    5900 2000
	0    1    1    0   
$EndComp
Connection ~ 5750 2000
Wire Wire Line
	5750 2000 5750 1250
Connection ~ 6150 2300
Wire Wire Line
	6150 1800 6150 2300
Wire Wire Line
	6450 1800 8900 1800
Wire Wire Line
	8900 1800 8900 2000
Connection ~ 8900 4100
Wire Wire Line
	8900 4100 10350 4100
Wire Wire Line
	6050 2000 8900 2000
Connection ~ 8900 2000
Wire Wire Line
	8900 2000 8900 2300
Wire Wire Line
	6450 2300 8900 2300
Connection ~ 8900 2300
Wire Wire Line
	8900 2300 8900 2900
$Comp
L Device:C C48
U 1 1 5CBA7C6D
P 4850 3950
F 0 "C48" H 4735 3904 50  0000 R CNN
F 1 "100n" H 4735 3995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4888 3800 50  0001 C CNN
F 3 "~" H 4850 3950 50  0001 C CNN
	1    4850 3950
	-1   0    0    1   
$EndComp
$Comp
L Device:C C47
U 1 1 5CBA7D22
P 4450 3950
F 0 "C47" H 4335 3904 50  0000 R CNN
F 1 "10n" H 4335 3995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4488 3800 50  0001 C CNN
F 3 "~" H 4450 3950 50  0001 C CNN
	1    4450 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 3800 5050 3800
Wire Wire Line
	5050 3700 4450 3700
Wire Wire Line
	4450 3700 4450 3800
Wire Wire Line
	4450 4100 4850 4100
Connection ~ 4850 4100
Connection ~ 6150 2400
Wire Wire Line
	6450 3700 6450 4100
Connection ~ 6450 3700
Wire Wire Line
	6450 3600 6450 3700
Connection ~ 6450 3600
Wire Wire Line
	6450 3500 6450 3600
Connection ~ 6450 3500
Wire Wire Line
	6450 3400 6450 3500
Wire Wire Line
	6450 3300 6450 3400
Connection ~ 6450 3400
Connection ~ 5750 2400
$Comp
L Sensor_Motion:LSM9DS1 U12
U 1 1 5CBA7137
P 5750 3200
F 0 "U12" H 5750 2314 50  0000 C CNN
F 1 "LSM9DS1" H 5750 2223 50  0000 C CNN
F 2 "Package_LGA:LGA-24L_3x3.5mm_P0.43mm" H 7250 3950 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/3f/2a/d6/25/eb/48/46/DM00103319.pdf/files/DM00103319.pdf/jcr:content/translations/en.DM00103319.pdf" H 5750 3300 50  0001 C CNN
	1    5750 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4100 5650 4100
Connection ~ 6450 4100
Wire Wire Line
	5850 4000 5850 4100
Connection ~ 5850 4100
Wire Wire Line
	5850 4100 6450 4100
Wire Wire Line
	5650 4000 5650 4100
Connection ~ 5650 4100
Wire Wire Line
	5650 4100 5850 4100
Text HLabel 10400 1250 2    50   Input ~ 0
+3V3
Text HLabel 10350 4100 2    50   BiDi ~ 0
GND
Wire Wire Line
	5050 2800 2000 2800
Wire Wire Line
	5050 2900 2000 2900
Text HLabel 2000 2800 0    50   BiDi ~ 0
SCL
Text HLabel 2000 2900 0    50   BiDi ~ 0
SDA
Wire Wire Line
	6450 2800 7050 2800
Wire Wire Line
	7050 2800 7050 1250
Connection ~ 7050 1250
Wire Wire Line
	7050 1250 10400 1250
Wire Wire Line
	5750 1250 4450 1250
Wire Wire Line
	4450 1250 4450 3100
Wire Wire Line
	4450 3100 5050 3100
Connection ~ 5750 1250
Wire Wire Line
	6450 2900 8900 2900
Connection ~ 8900 2900
Wire Wire Line
	8900 2900 8900 4100
Wire Wire Line
	5050 3200 3400 3200
Wire Wire Line
	3400 3200 3400 4100
Wire Wire Line
	3400 4100 4450 4100
Connection ~ 4450 4100
$EndSCHEMATC
