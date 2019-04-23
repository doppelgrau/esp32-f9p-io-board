EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 17
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
L Relay_own:CP1SA-12V-Z K2
U 1 1 5CEBBD54
P 5950 3100
F 0 "K2" H 5950 3465 50  0000 C CNN
F 1 "CP1SA-12V-Z" H 5950 3374 50  0000 C CNN
F 2 "Relay_own:CP1SA12VZ" H 6300 3300 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/cp-catalog-1299312.pdf" H 6300 3200 50  0001 L CNN
F 4 "PANASONIC ELECTRIC WORKS - CP1SA-12V-Z - RELAY, AUTOMOTIVE, SPDT, 14VDC, 20A" H 6300 3100 50  0001 L CNN "Description"
F 5 "10.5" H 6300 3000 50  0001 L CNN "Height"
F 6 "769-CP1SA-12V-Z" H 6300 2900 50  0001 L CNN "Mouser Part Number"
F 7 "Panasonic" H 6800 2600 50  0001 L CNN "Manufacturer_Name"
F 8 "CP1SA-12V-Z" H 6800 2500 50  0001 L CNN "Manufacturer_Part_Number"
	1    5950 3100
	1    0    0    -1  
$EndComp
$Comp
L GateDriver_own:NUD3124LT1G U10
U 1 1 5CEBBF42
P 6350 2400
F 0 "U10" H 6300 2715 50  0000 C CNN
F 1 "NUD3124LT1G" H 6300 2624 50  0000 C CNN
F 2 "ICs_own:SOT95P237X100-3N" H 5900 2000 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/308/NUD3124-D-91887.pdf" H 5300 1700 50  0001 L CNN
F 4 "ON Semiconductor NUD3124LT1G, MOSFET Power Driver, 150mA, 3-Pin SOT-23" H 5100 1550 50  0001 L CNN "Description"
F 5 "1" H 6800 2250 50  0001 L CNN "Height"
F 6 "ON Semiconductor" H 6200 1900 50  0001 L CNN "Manufacturer_Name"
F 7 "NUD3124LT1G" H 6200 1800 50  0001 L CNN "Manufacturer_Part_Number"
	1    6350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3000 6950 3000
Wire Wire Line
	6950 3000 6950 2350
Wire Wire Line
	5650 2350 1100 2350
Wire Wire Line
	1100 2450 5650 2450
Wire Wire Line
	5450 3200 1100 3200
Wire Wire Line
	5450 3000 5100 3000
Wire Wire Line
	5100 3000 5100 4200
Wire Wire Line
	5100 4200 10750 4200
Wire Wire Line
	5450 3100 5300 3100
Wire Wire Line
	5300 3100 5300 4350
Wire Wire Line
	5300 4350 10750 4350
Wire Wire Line
	6450 3100 6450 4050
Wire Wire Line
	6450 4050 10750 4050
Text HLabel 10750 4200 2    50   BiDi ~ 0
COM
Text HLabel 10750 4050 2    50   BiDi ~ 0
NC
Text HLabel 10750 4350 2    50   BiDi ~ 0
NO
Text HLabel 1100 2350 0    50   BiDi ~ 0
Enable
Text HLabel 1100 2450 0    50   BiDi ~ 0
GND
Text HLabel 1100 3200 0    50   BiDi ~ 0
+12V
$EndSCHEMATC
