EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 17
Title "H-Bridge Motor Driver"
Date ""
Rev "0.1"
Comp ""
Comment1 "Based on STM VNH7070ASTR"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5600 1450 2    50   Output ~ 0
outA
Text HLabel 5600 1650 2    50   Output ~ 0
outB
Text HLabel 850  1450 0    50   Input ~ 0
INA
Text HLabel 850  1750 0    50   Input ~ 0
InB
Text HLabel 850  2050 0    50   Input ~ 0
PWM
$Comp
L Driver_Motor_own:VNH7070AS U3
U 1 1 5C445805
P 3300 1350
AR Path="/5C443F4F/5C445805" Ref="U3"  Part="1" 
AR Path="/5C443F5E/5C445805" Ref="U?"  Part="1" 
AR Path="/5C9CCBB2/5C445805" Ref="U5"  Part="1" 
AR Path="/5C9DA548/5C445805" Ref="U?"  Part="1" 
AR Path="/5C9DA551/5C445805" Ref="U9"  Part="1" 
F 0 "U9" H 3300 1666 50  0000 C CNN
F 1 "VNH7070AS" H 3300 1575 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3250 1400 50  0001 C CNN
F 3 "" H 3250 1400 50  0001 C CNN
	1    3300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 750  3300 1250
Wire Wire Line
	3850 1450 5600 1450
Wire Wire Line
	2750 2950 2750 1800
Wire Wire Line
	3150 2150 3150 2950
Connection ~ 3150 2950
Wire Wire Line
	3150 2950 2750 2950
Wire Wire Line
	3500 2150 3500 2950
Wire Wire Line
	3150 2950 3500 2950
Connection ~ 3500 2950
Wire Wire Line
	3500 2950 4150 2950
$Comp
L Device:C C12
U 1 1 5C44655B
P 4150 900
AR Path="/5C443F4F/5C44655B" Ref="C12"  Part="1" 
AR Path="/5C443F5E/5C44655B" Ref="C?"  Part="1" 
AR Path="/5C9CCBB2/5C44655B" Ref="C21"  Part="1" 
AR Path="/5C9DA548/5C44655B" Ref="C?"  Part="1" 
AR Path="/5C9DA551/5C44655B" Ref="C32"  Part="1" 
F 0 "C32" H 4265 946 50  0000 L CNN
F 1 "100n" H 4265 855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4188 750 50  0001 C CNN
F 3 "~" H 4150 900 50  0001 C CNN
	1    4150 900 
	1    0    0    -1  
$EndComp
Connection ~ 4150 750 
Wire Wire Line
	4150 750  3300 750 
Wire Wire Line
	4150 1050 4150 2950
Connection ~ 4150 2950
Wire Wire Line
	4150 2950 5600 2950
Wire Wire Line
	3850 1650 5600 1650
Wire Wire Line
	1900 1750 1900 1550
Wire Wire Line
	1900 1550 2750 1550
Wire Wire Line
	2250 2050 2250 1650
Wire Wire Line
	2250 1650 2750 1650
Wire Wire Line
	4150 750  4950 750 
$Comp
L power:GND #PWR?
U 1 1 5C60F6E8
P 5600 2950
AR Path="/5C443F5E/5C60F6E8" Ref="#PWR?"  Part="1" 
AR Path="/5C443F4F/5C60F6E8" Ref="#PWR047"  Part="1" 
AR Path="/5C9CCBB2/5C60F6E8" Ref="#PWR049"  Part="1" 
AR Path="/5C9DA548/5C60F6E8" Ref="#PWR?"  Part="1" 
AR Path="/5C9DA551/5C60F6E8" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 5600 2700 50  0001 C CNN
F 1 "GND" H 5605 2777 50  0000 C CNN
F 2 "" H 5600 2950 50  0001 C CNN
F 3 "" H 5600 2950 50  0001 C CNN
	1    5600 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5C60F720
P 5600 750
AR Path="/5C443F5E/5C60F720" Ref="#PWR?"  Part="1" 
AR Path="/5C443F4F/5C60F720" Ref="#PWR046"  Part="1" 
AR Path="/5C9CCBB2/5C60F720" Ref="#PWR048"  Part="1" 
AR Path="/5C9DA548/5C60F720" Ref="#PWR?"  Part="1" 
AR Path="/5C9DA551/5C60F720" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 5600 600 50  0001 C CNN
F 1 "+12V" H 5615 923 50  0000 C CNN
F 2 "" H 5600 750 50  0001 C CNN
F 3 "" H 5600 750 50  0001 C CNN
	1    5600 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1450 2750 1450
Wire Wire Line
	850  1750 1900 1750
Wire Wire Line
	850  2050 2250 2050
$Comp
L Device:CP C13
U 1 1 5C9C254B
P 4950 900
AR Path="/5C443F4F/5C9C254B" Ref="C13"  Part="1" 
AR Path="/5C9CCBB2/5C9C254B" Ref="C22"  Part="1" 
AR Path="/5C9DA548/5C9C254B" Ref="C?"  Part="1" 
AR Path="/5C9DA551/5C9C254B" Ref="C33"  Part="1" 
F 0 "C33" H 5068 946 50  0000 L CNN
F 1 "560u" H 5068 855 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_10x10.5" H 4988 750 50  0001 C CNN
F 3 "~" H 4950 900 50  0001 C CNN
	1    4950 900 
	1    0    0    -1  
$EndComp
Connection ~ 4950 750 
Wire Wire Line
	4950 750  5600 750 
Wire Wire Line
	4950 1050 4150 1050
Connection ~ 4150 1050
$EndSCHEMATC
