EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 17
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_UART_own:ICL3221EIVZ IC3
U 1 1 5CF77802
P 5600 3150
F 0 "IC3" H 5600 3765 50  0000 C CNN
F 1 "ICL3221EIVZ" H 5600 3674 50  0000 C CNN
F 2 "ICs_own:SOP65P640X120-16N" H 4500 2500 50  0001 L CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/icl3/icl3221e-22e-23e-32e-41e-43e.pdf" H 4500 2400 50  0001 L CNN
F 4 "Intersil ICL3221EIVZ, Line Transceiver, EIA/TIA-232/ RS-232/ V.24/ V.28, 3.3 V, 5 V, 16-Pin TSSOP" H 4500 2300 50  0001 L CNN "Description"
F 5 "1.2" H 6100 3300 50  0001 L CNN "Height"
F 6 "Intersil" H 6100 3000 50  0001 L CNN "Manufacturer_Name"
F 7 "ICL3221EIVZ" H 4500 2600 50  0001 L CNN "Manufacturer_Part_Number"
	1    5600 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C45
U 1 1 5CF77964
P 4450 2100
F 0 "C45" H 4335 2054 50  0000 R CNN
F 1 "100n" H 4335 2145 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4488 1950 50  0001 C CNN
F 3 "~" H 4450 2100 50  0001 C CNN
	1    4450 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C44
U 1 1 5CF779C2
P 3750 2500
F 0 "C44" V 4002 2500 50  0000 C CNN
F 1 "100n" V 3911 2500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3788 2350 50  0001 C CNN
F 3 "~" H 3750 2500 50  0001 C CNN
	1    3750 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C46
U 1 1 5CF77A14
P 6400 2750
F 0 "C46" H 6285 2704 50  0000 R CNN
F 1 "100n" H 6285 2795 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6438 2600 50  0001 C CNN
F 3 "~" H 6400 2750 50  0001 C CNN
	1    6400 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C43
U 1 1 5CF77A3E
P 3250 2500
F 0 "C43" V 3502 2500 50  0000 C CNN
F 1 "100n" V 3411 2500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3288 2350 50  0001 C CNN
F 3 "~" H 3250 2500 50  0001 C CNN
	1    3250 2500
	0    -1   -1   0   
$EndComp
NoConn ~ 6250 3400
Wire Wire Line
	4950 2900 3900 2900
Wire Wire Line
	3900 2900 3900 2500
Wire Wire Line
	4950 3100 3600 3100
Wire Wire Line
	3600 3100 3600 2500
Wire Wire Line
	9100 1750 8100 1750
Wire Wire Line
	4950 1750 4950 2800
Wire Wire Line
	6250 2900 6300 2900
Wire Wire Line
	6700 2900 6700 1900
Wire Wire Line
	6700 1900 9100 1900
Wire Wire Line
	6250 2800 6300 2800
Wire Wire Line
	6300 2800 6300 2900
Connection ~ 6300 2900
Wire Wire Line
	6300 2900 6400 2900
Connection ~ 6400 2900
Wire Wire Line
	6400 2900 6700 2900
Wire Wire Line
	6400 2600 6400 1750
Connection ~ 6400 1750
Wire Wire Line
	6400 1750 4950 1750
Wire Wire Line
	4950 3200 3400 3200
Wire Wire Line
	3400 3200 3400 2500
Wire Wire Line
	4950 3300 3100 3300
Wire Wire Line
	3100 3300 3100 2500
$Comp
L Device:C C42
U 1 1 5CF794FF
P 2600 2100
F 0 "C42" H 2485 2054 50  0000 R CNN
F 1 "100n" H 2485 2145 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2638 1950 50  0001 C CNN
F 3 "~" H 2600 2100 50  0001 C CNN
	1    2600 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 3400 2600 3400
Wire Wire Line
	2600 3400 2600 2250
Wire Wire Line
	2600 1950 2600 1750
Wire Wire Line
	2600 1750 4450 1750
Connection ~ 4950 1750
Wire Wire Line
	4450 1950 4450 1750
Connection ~ 4450 1750
Wire Wire Line
	4450 1750 4950 1750
Wire Wire Line
	4450 2250 4450 3000
Wire Wire Line
	4450 3000 4950 3000
Wire Wire Line
	6250 3000 7100 3000
Wire Wire Line
	7100 3000 7100 1750
Connection ~ 7100 1750
Wire Wire Line
	7100 1750 6400 1750
Text HLabel 6250 3300 2    50   BiDi ~ 0
UART_TX
Text HLabel 6250 3500 2    50   BiDi ~ 0
UART_RX
Text HLabel 9100 1750 2    50   BiDi ~ 0
GND
Text HLabel 9100 1900 2    50   BiDi ~ 0
+3V3
$Comp
L Connector:DB9_Male_MountingHoles J16
U 1 1 5CADB03E
P 5600 4900
F 0 "J16" V 5473 5455 50  0000 L CNN
F 1 "DB9_Male_MountingHoles" V 5564 5455 50  0000 L CNN
F 2 "Connector_own:LD09P33E4GV00LF" H 5600 4900 50  0001 C CNN
F 3 " ~" H 5600 4900 50  0001 C CNN
	1    5600 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 4600 5400 4050
Wire Wire Line
	5400 4050 4300 4050
Wire Wire Line
	4300 4050 4300 3500
Wire Wire Line
	4300 3500 4950 3500
Wire Wire Line
	6250 3100 6750 3100
Wire Wire Line
	6750 3100 6750 4050
Wire Wire Line
	6750 4050 5600 4050
Wire Wire Line
	5600 4050 5600 4600
Wire Wire Line
	6000 4600 6000 4350
Wire Wire Line
	6000 4350 7550 4350
Wire Wire Line
	7550 4350 7550 1750
Connection ~ 7550 1750
Wire Wire Line
	7550 1750 7100 1750
Wire Wire Line
	8100 1750 8100 5600
Wire Wire Line
	8100 5600 5000 5600
Wire Wire Line
	5000 5600 5000 4900
Connection ~ 8100 1750
Wire Wire Line
	8100 1750 7550 1750
Wire Wire Line
	6400 2900 6400 3200
Wire Wire Line
	6400 3200 6250 3200
$EndSCHEMATC
