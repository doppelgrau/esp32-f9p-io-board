EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
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
	4800 3450 5050 3450
NoConn ~ 5050 2250
NoConn ~ 5050 2350
NoConn ~ 5050 2450
NoConn ~ 5050 2550
NoConn ~ 5050 2650
NoConn ~ 5050 2950
NoConn ~ 5050 3050
NoConn ~ 5050 3150
NoConn ~ 5050 3250
NoConn ~ 5050 3350
NoConn ~ 5050 3550
NoConn ~ 5600 2650
NoConn ~ 5600 3050
NoConn ~ 5600 3150
NoConn ~ 5600 3350
Wire Wire Line
	5600 2950 5900 2950
Wire Wire Line
	5850 2650 5850 2750
Wire Wire Line
	5850 2750 5600 2750
Wire Wire Line
	5600 3250 5900 3250
$Comp
L Connector:Conn_01x08_Female J9
U 1 1 5C9A6566
P 5250 2250
F 0 "J9" H 5150 2800 50  0000 L CNN
F 1 "Conn_01x08_Female" H 4950 2700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 5250 2250 50  0001 C CNN
F 3 "" H 5250 2250 50  0001 C CNN
	1    5250 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J10
U 1 1 5C9A656D
P 5250 3150
F 0 "J10" H 5100 2650 50  0000 L CNN
F 1 "Conn_01x08_Female" H 4700 2550 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 5250 3150 50  0001 C CNN
F 3 "" H 5250 3150 50  0001 C CNN
	1    5250 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J11
U 1 1 5C9A6574
P 5400 2950
F 0 "J11" H 5294 3435 50  0000 C CNN
F 1 "Conn_01x08_Female" H 5300 3350 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 5400 2950 50  0001 C CNN
F 3 "" H 5400 2950 50  0001 C CNN
	1    5400 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5600 2850 5850 2850
Wire Wire Line
	5850 2750 5850 2850
Connection ~ 5850 2750
Text HLabel 5850 2650 2    50   BiDi ~ 0
GND
Text HLabel 5900 2950 2    50   BiDi ~ 0
+5V
Text HLabel 5900 3250 2    50   BiDi ~ 0
+3V3
Wire Wire Line
	4800 3450 4800 4250
Wire Wire Line
	4800 4250 7600 4250
Wire Wire Line
	7600 4250 7600 2750
Wire Wire Line
	7600 2750 5850 2750
Text HLabel 5050 1950 0    50   Output ~ 0
TX1
Text HLabel 5050 2050 0    50   Input ~ 0
RX1
Text HLabel 5050 2150 0    50   Output ~ 0
TX2
Text HLabel 5050 2850 0    50   Input ~ 0
RX2
$EndSCHEMATC
