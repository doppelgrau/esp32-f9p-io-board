EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 17
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
L Interface_CAN_LIN_own:ATA6561-GAQW-N IC2
U 1 1 5CACB7D0
P 5550 2300
F 0 "IC2" H 5550 2715 50  0000 C CNN
F 1 "ATA6561-GAQW-N" H 5550 2624 50  0000 C CNN
F 2 "ICs_own:SOIC127P600X175-8N" H 5950 2550 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/ATA6561-GAQW-N.pdf" H 5950 2450 50  0001 L CNN
F 4 "MICROCHIP - ATA6561-GAQW-N - CAN TRANSCEIVER, 5MBPS, -40 TO 150DEG C" H 5950 2350 50  0001 L CNN "Description"
F 5 "1.75" H 5950 2250 50  0001 L CNN "Height"
F 6 "579-ATA6561-GAQW-N" H 5950 2150 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=579-ATA6561-GAQW-N" H 5950 2050 50  0001 L CNN "Mouser Price/Stock"
F 8 "Microchip" H 5950 1950 50  0001 L CNN "Manufacturer_Name"
F 9 "ATA6561-GAQW-N" H 5950 1850 50  0001 L CNN "Manufacturer_Part_Number"
	1    5550 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J12
U 1 1 5CACBC2B
P 7200 1700
F 0 "J12" H 7250 1375 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 7250 1466 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Horizontal" H 7200 1700 50  0001 C CNN
F 3 "~" H 7200 1700 50  0001 C CNN
	1    7200 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6100 2350 7600 2350
Wire Wire Line
	9450 2250 6900 2250
Wire Wire Line
	7600 2350 7600 1800
Connection ~ 7600 2350
Wire Wire Line
	7600 2350 9450 2350
$Comp
L Device:R R33
U 1 1 5CACBF66
P 6900 2100
F 0 "R33" H 6970 2146 50  0000 L CNN
F 1 "120" H 6970 2055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 2100 50  0001 C CNN
F 3 "~" H 6900 2100 50  0001 C CNN
	1    6900 2100
	1    0    0    -1  
$EndComp
Connection ~ 6900 2250
Wire Wire Line
	6900 2250 6100 2250
Wire Wire Line
	7400 1700 7650 1700
Text HLabel 1050 1350 0    50   Input ~ 0
TXD
Text HLabel 1050 1550 0    50   Output ~ 0
RXD
Text HLabel 1050 2800 0    50   BiDi ~ 0
5V
Text HLabel 1050 2950 0    50   BiDi ~ 0
3V3
Text HLabel 1050 3100 0    50   BiDi ~ 0
GND
Wire Wire Line
	5000 2450 2550 2450
Wire Wire Line
	2550 2450 2550 1550
Wire Wire Line
	2550 1550 1050 1550
Wire Wire Line
	1050 2800 3500 2800
Wire Wire Line
	4800 2800 4800 2700
Wire Wire Line
	4800 2350 5000 2350
Wire Wire Line
	1050 2950 6100 2950
Wire Wire Line
	6100 2950 6100 2700
$Comp
L Device:C C27
U 1 1 5CACCF27
P 6250 2700
F 0 "C27" V 5998 2700 50  0000 C CNN
F 1 "100n" V 6089 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6288 2550 50  0001 C CNN
F 3 "~" H 6250 2700 50  0001 C CNN
	1    6250 2700
	0    1    1    0   
$EndComp
Connection ~ 6100 2700
Wire Wire Line
	6100 2700 6100 2450
Wire Wire Line
	6100 2150 6400 2150
Wire Wire Line
	6400 2150 6400 2700
Connection ~ 6400 2700
Wire Wire Line
	6400 2700 6400 3100
$Comp
L Device:C C26
U 1 1 5CACD350
P 4650 2700
F 0 "C26" V 4398 2700 50  0000 C CNN
F 1 "100n" V 4489 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4688 2550 50  0001 C CNN
F 3 "~" H 4650 2700 50  0001 C CNN
	1    4650 2700
	0    1    1    0   
$EndComp
Connection ~ 4800 2700
Wire Wire Line
	4800 2700 4800 2350
Wire Wire Line
	1050 3100 3500 3100
Wire Wire Line
	4500 2250 4500 2700
Wire Wire Line
	4500 2250 5000 2250
Connection ~ 4500 3100
Wire Wire Line
	4500 3100 6400 3100
Connection ~ 4500 2700
Wire Wire Line
	4500 2700 4500 3100
$Comp
L Device:C C25
U 1 1 5CACDBDC
P 3500 2950
F 0 "C25" H 3615 2996 50  0000 L CNN
F 1 "22u" H 3615 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3538 2800 50  0001 C CNN
F 3 "~" H 3500 2950 50  0001 C CNN
	1    3500 2950
	1    0    0    -1  
$EndComp
Connection ~ 3500 2800
Wire Wire Line
	3500 2800 4800 2800
Connection ~ 3500 3100
Wire Wire Line
	3500 3100 4500 3100
$Comp
L Connector_own:PTSM-Header-Horizontal-2 J18
U 1 1 5CC27296
P 9850 2300
F 0 "J18" H 10078 2346 50  0000 L CNN
F 1 "PTSM-Header-Horizontal-2" H 10078 2255 50  0000 L CNN
F 2 "Connector_own:1814841" H 9100 2000 50  0001 L CNN
F 3 "" H 9100 1900 50  0001 L CNN
F 4 "Phoenix Contact PTSM Series, 2.5mm Pitch 2 Way 1 Row Right Angle PCB Terminal Block, Solder Termination, 6A" H 9100 1800 50  0001 L CNN "Description"
F 5 "5" H 9100 1700 50  0001 L CNN "Height"
F 6 "651-1814841" H 9100 1600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1814841" H 9100 1500 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 9100 1400 50  0001 L CNN "Manufacturer_Name"
F 9 "1814841" H 9100 1300 50  0001 L CNN "Manufacturer_Part_Number"
	1    9850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1050 7650 1050
Wire Wire Line
	7650 1050 7650 1700
Wire Wire Line
	5000 1050 5000 2150
Wire Wire Line
	3800 1700 3800 1350
Wire Wire Line
	3800 1350 1050 1350
Wire Wire Line
	7400 1800 7600 1800
Wire Wire Line
	3800 1700 6900 1700
Wire Wire Line
	6900 1800 6900 1950
$EndSCHEMATC
