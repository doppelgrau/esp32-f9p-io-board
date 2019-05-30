EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 17
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5550 2600 2    50   BiDi ~ 0
GND
Text HLabel 5550 2300 2    50   Output ~ 0
output
Text HLabel 2550 2300 0    50   Input ~ 0
input
$Comp
L Device:R R18
U 1 1 5C4E78E9
P 3200 2300
AR Path="/5C4EB24D/5C4E78E9" Ref="R18"  Part="1" 
AR Path="/5C4EB277/5C4E78E9" Ref="R20"  Part="1" 
AR Path="/5C4EB28C/5C4E78E9" Ref="R?"  Part="1" 
AR Path="/5C9B01EE/5C4E78E9" Ref="R31"  Part="1" 
AR Path="/5C9B01F3/5C4E78E9" Ref="R?"  Part="1" 
AR Path="/5CD0B67B/5C4E78E9" Ref="R?"  Part="1" 
F 0 "R31" V 2993 2300 50  0000 C CNN
F 1 "47k" V 3084 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3130 2300 50  0001 C CNN
F 3 "~" H 3200 2300 50  0001 C CNN
	1    3200 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5C4E791C
P 4150 2450
AR Path="/5C4EB24D/5C4E791C" Ref="R19"  Part="1" 
AR Path="/5C4EB277/5C4E791C" Ref="R21"  Part="1" 
AR Path="/5C4EB28C/5C4E791C" Ref="R?"  Part="1" 
AR Path="/5C9B01EE/5C4E791C" Ref="R32"  Part="1" 
AR Path="/5C9B01F3/5C4E791C" Ref="R?"  Part="1" 
AR Path="/5CD0B67B/5C4E791C" Ref="R?"  Part="1" 
F 0 "R32" H 4220 2496 50  0000 L CNN
F 1 "12.1k" H 4220 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4080 2450 50  0001 C CNN
F 3 "~" H 4150 2450 50  0001 C CNN
	1    4150 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5C4E7961
P 4700 2450
AR Path="/5C4EB24D/5C4E7961" Ref="C14"  Part="1" 
AR Path="/5C4EB277/5C4E7961" Ref="C15"  Part="1" 
AR Path="/5C4EB28C/5C4E7961" Ref="C?"  Part="1" 
AR Path="/5C9B01EE/5C4E7961" Ref="C24"  Part="1" 
AR Path="/5C9B01F3/5C4E7961" Ref="C?"  Part="1" 
AR Path="/5CD0B67B/5C4E7961" Ref="C?"  Part="1" 
F 0 "C24" H 4815 2496 50  0000 L CNN
F 1 "1n" H 4815 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 2300 50  0001 C CNN
F 3 "~" H 4700 2450 50  0001 C CNN
	1    4700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2300 3050 2300
Wire Wire Line
	3350 2300 4150 2300
Connection ~ 4150 2300
Wire Wire Line
	4150 2300 4700 2300
Connection ~ 4700 2300
Wire Wire Line
	4700 2300 5550 2300
Wire Wire Line
	4150 2600 4700 2600
Connection ~ 4700 2600
Wire Wire Line
	4700 2600 5550 2600
$EndSCHEMATC
