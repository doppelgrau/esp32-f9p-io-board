EESchema Schematic File Version 4
LIBS:mainPCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 17
Title "I2C - Levelconverter and connections"
Date "2019-04-10"
Rev "0.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 5CA18ACF
P 1750 1900
AR Path="/5CA18ACF" Ref="R?"  Part="1" 
AR Path="/5CA10EE5/5CA18ACF" Ref="R26"  Part="1" 
F 0 "R26" H 1820 1946 50  0000 L CNN
F 1 "2.4k" H 1820 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1680 1900 50  0001 C CNN
F 3 "" H 1750 1900 50  0001 C CNN
	1    1750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5CA18AD7
P 2200 1900
AR Path="/5CA18AD7" Ref="R?"  Part="1" 
AR Path="/5CA10EE5/5CA18AD7" Ref="R27"  Part="1" 
F 0 "R27" H 2270 1946 50  0000 L CNN
F 1 "2.4k" H 2270 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2130 1900 50  0001 C CNN
F 3 "" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5CA18AF1
P 2350 2450
AR Path="/5CA18AF1" Ref="J?"  Part="1" 
AR Path="/5CA10EE5/5CA18AF1" Ref="J7"  Part="1" 
F 0 "J7" V 2503 2163 50  0000 R CNN
F 1 "Conn_01x04_Male" V 2412 2163 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Horizontal" H 2350 2450 50  0001 C CNN
F 3 "" H 2350 2450 50  0001 C CNN
	1    2350 2450
	1    0    0    -1  
$EndComp
$Comp
L Interface:PCA9306 U?
U 1 1 5CA193BD
P 4800 3650
AR Path="/5C531571/5CA193BD" Ref="U?"  Part="1" 
AR Path="/5CA10EE5/5CA193BD" Ref="U6"  Part="1" 
F 0 "U6" H 4800 3064 50  0000 C CNN
F 1 "PCA9306DCTR" H 4800 2973 50  0000 C CNN
F 2 "Package_SO:SSOP-8_2.95x2.8mm_P0.65mm" H 4400 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/pca9306.pdf" H 4500 4100 50  0001 C CNN
	1    4800 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4400 3550 4400 3150
Wire Wire Line
	4400 3150 4700 3150
$Comp
L Device:R R?
U 1 1 5CA193CC
P 4700 2550
AR Path="/5C531571/5CA193CC" Ref="R?"  Part="1" 
AR Path="/5CA10EE5/5CA193CC" Ref="R28"  Part="1" 
F 0 "R28" H 4770 2596 50  0000 L CNN
F 1 "220k" H 4770 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 2550 50  0001 C CNN
F 3 "~" H 4700 2550 50  0001 C CNN
	1    4700 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5CA193D5
P 4400 2700
AR Path="/5C531571/5CA193D5" Ref="C?"  Part="1" 
AR Path="/5CA10EE5/5CA193D5" Ref="C23"  Part="1" 
F 0 "C23" V 4148 2700 50  0000 C CNN
F 1 "1n" V 4239 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4438 2550 50  0001 C CNN
F 3 "~" H 4400 2700 50  0001 C CNN
	1    4400 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 2700 4700 2700
Wire Wire Line
	4700 2700 4700 3150
Connection ~ 4700 2700
Connection ~ 4700 3150
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5CA1A349
P 7050 2400
AR Path="/5C531571/5CA1A349" Ref="J?"  Part="1" 
AR Path="/5CA10EE5/5CA1A349" Ref="J8"  Part="1" 
F 0 "J8" V 7110 2540 50  0000 L CNN
F 1 "Conn_01x04_Male" V 7201 2540 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7050 2400 50  0001 C CNN
F 3 "~" H 7050 2400 50  0001 C CNN
	1    7050 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5CA1A35E
P 6700 1950
AR Path="/5C531571/5CA1A35E" Ref="R?"  Part="1" 
AR Path="/5CA10EE5/5CA1A35E" Ref="R30"  Part="1" 
F 0 "R30" V 6493 1950 50  0000 C CNN
F 1 "2.4k" V 6584 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6630 1950 50  0001 C CNN
F 3 "~" H 6700 1950 50  0001 C CNN
	1    6700 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5CA1A367
P 6300 1950
AR Path="/5C531571/5CA1A367" Ref="R?"  Part="1" 
AR Path="/5CA10EE5/5CA1A367" Ref="R29"  Part="1" 
F 0 "R29" V 6093 1950 50  0000 C CNN
F 1 "2.4k" V 6184 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6230 1950 50  0001 C CNN
F 3 "~" H 6300 1950 50  0001 C CNN
	1    6300 1950
	1    0    0    -1  
$EndComp
Text HLabel 1100 5100 0    50   Input ~ 0
I2C_3_SDA
Text HLabel 1100 5250 0    50   Input ~ 0
I2C_3_SCL
Text HLabel 1000 1150 0    50   Input ~ 0
+3V3
Text HLabel 1000 950  0    50   Input ~ 0
+5V
Text HLabel 1100 5800 0    50   UnSpc ~ 0
GND
Text HLabel 1200 3750 0    50   Input ~ 0
I2C_5_SDA
Text HLabel 1200 3650 0    50   Input ~ 0
I2C_5_SCL
Wire Wire Line
	1200 3650 2200 3650
Wire Wire Line
	1200 3750 1750 3750
Wire Wire Line
	4900 1150 1000 1150
Wire Wire Line
	4900 1150 4900 3150
Wire Wire Line
	1000 950  1750 950 
Wire Wire Line
	4700 950  4700 2400
Wire Wire Line
	1100 5800 2750 5800
Wire Wire Line
	4250 5800 4250 2700
Wire Wire Line
	1750 1750 1750 950 
Connection ~ 1750 950 
Wire Wire Line
	1750 950  2200 950 
Wire Wire Line
	2200 1750 2200 950 
Connection ~ 2200 950 
Wire Wire Line
	2200 950  2550 950 
Wire Wire Line
	2200 2050 2200 3650
Connection ~ 2200 3650
Wire Wire Line
	2200 3650 2650 3650
Wire Wire Line
	1750 2050 1750 3750
Connection ~ 1750 3750
Wire Wire Line
	1750 3750 2550 3750
Wire Wire Line
	6700 1150 6700 1800
Connection ~ 4900 1150
Wire Wire Line
	6300 1800 6300 1150
Wire Wire Line
	7350 1150 7350 2300
Wire Wire Line
	7350 2300 7250 2300
Wire Wire Line
	7250 2400 7650 2400
Wire Wire Line
	7650 2400 7650 5800
Wire Wire Line
	7650 5800 4800 5800
Connection ~ 4250 5800
Wire Wire Line
	1100 5100 7850 5100
Wire Wire Line
	7850 5100 7850 4350
Wire Wire Line
	1100 5250 8000 5250
Wire Wire Line
	8000 5250 8000 3650
Wire Wire Line
	7250 2600 7250 3750
Connection ~ 7250 3750
Wire Wire Line
	7250 3750 7850 3750
Wire Wire Line
	7450 3650 7450 2500
Wire Wire Line
	7450 2500 7250 2500
Connection ~ 7450 3650
Wire Wire Line
	7450 3650 8000 3650
Wire Wire Line
	4900 1150 6300 1150
Connection ~ 6300 1150
Connection ~ 6700 1150
Wire Wire Line
	6700 1150 7350 1150
Wire Wire Line
	6300 1150 6700 1150
Wire Wire Line
	5200 3650 6700 3650
Wire Wire Line
	5200 3750 6300 3750
Wire Wire Line
	6300 2100 6300 3750
Connection ~ 6300 3750
Wire Wire Line
	6300 3750 7250 3750
Wire Wire Line
	6700 2100 6700 3650
Connection ~ 6700 3650
Wire Wire Line
	6700 3650 7450 3650
Wire Wire Line
	2550 2650 2550 3750
Connection ~ 2550 3750
Wire Wire Line
	2550 3750 4400 3750
Wire Wire Line
	2550 2550 2650 2550
Wire Wire Line
	2650 2550 2650 3650
Connection ~ 2650 3650
Wire Wire Line
	2650 3650 4400 3650
Wire Wire Line
	2550 2450 2750 2450
Wire Wire Line
	2750 2450 2750 5800
Connection ~ 2750 5800
Wire Wire Line
	2750 5800 4250 5800
Wire Wire Line
	2550 2350 2550 950 
Connection ~ 2550 950 
Wire Wire Line
	2550 950  4700 950 
$Comp
L Connector_own:SM04B-SRSS-TB(LF)(SN) J13
U 1 1 5CC11751
P 8950 2400
F 0 "J13" V 8996 2222 50  0000 R CNN
F 1 "SM04B-SRSS-TB(LF)(SN)" V 8905 2222 50  0000 R CNN
F 2 "Connector_own:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 8200 2150 50  0001 L CNN
F 3 "http://www.jst-mfg.com/product/pdf/eng/eSH.pdf" H 8200 2050 50  0001 L CNN
F 4 "JST (JAPAN SOLDERLESS TERMINALS) - SM04B-SRSS-TB(LF)(SN) - CONNECTOR, HEADER, SMT, R/A, 1MM, 4WAY" H 8200 1950 50  0001 L CNN "Description"
F 5 "JST (JAPAN SOLDERLESS TERMINALS)" H 8200 1850 50  0001 L CNN "Manufacturer_Name"
F 6 "SM04B-SRSS-TB(LF)(SN)" H 8200 1750 50  0001 L CNN "Manufacturer_Part_Number"
	1    8950 2400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_own:SM04B-SRSS-TB(LF)(SN) J17
U 1 1 5CC131AA
P 9900 2400
F 0 "J17" V 9946 2222 50  0000 R CNN
F 1 "SM04B-SRSS-TB(LF)(SN)" V 9855 2222 50  0000 R CNN
F 2 "Connector_own:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 9150 2150 50  0001 L CNN
F 3 "http://www.jst-mfg.com/product/pdf/eng/eSH.pdf" H 9150 2050 50  0001 L CNN
F 4 "JST (JAPAN SOLDERLESS TERMINALS) - SM04B-SRSS-TB(LF)(SN) - CONNECTOR, HEADER, SMT, R/A, 1MM, 4WAY" H 9150 1950 50  0001 L CNN "Description"
F 5 "JST (JAPAN SOLDERLESS TERMINALS)" H 9150 1850 50  0001 L CNN "Manufacturer_Name"
F 6 "SM04B-SRSS-TB(LF)(SN)" H 9150 1750 50  0001 L CNN "Manufacturer_Part_Number"
	1    9900 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 2800 8900 5800
Wire Wire Line
	8900 5800 7650 5800
Connection ~ 7650 5800
Wire Wire Line
	9850 2800 9850 5800
Wire Wire Line
	9850 5800 8900 5800
Connection ~ 8900 5800
Wire Wire Line
	7350 1150 8900 1150
Wire Wire Line
	9850 1150 9850 2000
Connection ~ 7350 1150
Wire Wire Line
	8900 2000 8900 1150
Connection ~ 8900 1150
Wire Wire Line
	8900 1150 9850 1150
Wire Wire Line
	8000 3650 8000 1600
Wire Wire Line
	8000 1600 9000 1600
Wire Wire Line
	9950 1600 9950 2000
Connection ~ 8000 3650
Wire Wire Line
	9000 2000 9000 1600
Connection ~ 9000 1600
Wire Wire Line
	9000 1600 9950 1600
Wire Wire Line
	7850 4350 9000 4350
Wire Wire Line
	9950 4350 9950 2800
Connection ~ 7850 4350
Wire Wire Line
	7850 4350 7850 3750
Wire Wire Line
	9000 2800 9000 4350
Connection ~ 9000 4350
Wire Wire Line
	9000 4350 9950 4350
Wire Wire Line
	4800 4150 4800 5800
Connection ~ 4800 5800
Wire Wire Line
	4800 5800 4250 5800
$EndSCHEMATC
