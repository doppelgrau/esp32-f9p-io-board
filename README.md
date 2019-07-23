# ESP32 F9P IO board

This PCB is a versatile IO plattform that provides computing power (ESP32) and IO interfaces to build GPS/RTK applications.

## Hardware Overview

- Power supply: 
    - Input 9V-28V (labeld 12V on the board), external connection on J4. 
    - Protected against wrong polarity (Diode D7 parallel to the relay K1)
    - Reduced inrush current (resistors R15/16 in serie with the starting diode D7 before the relay K1 closes and shortens the path).
    - V78E05-1000 (step down converter) PS1 generates 5V
    - AZ1117-3.3 LDO U2 generates 3V from the 5V supply.
- ESP32-WROOM-32 U1 for computing-power, wifi, Bluetooth
- Arduino headers for the F9P (uart 1 of the F9P connected)
- Serial interfaces
    - one uart (IO13/14) on the Arduino headers for the F9P
    - one uart (IO0/2) next to the arduino headers on two pins (J2) for the new simpleRTK2Blight. Since the two pins have a special meaning during boot, pulling RX to GND during startup results in the ESP going into programming mode.
    - one uart (IO15/16) for RS232 on the D-Sub connector J16
    - one uart (IO1/3) on the USB-Uart converter (J14) - Also supports programming with "RTS/DTR"
- I2C (IO32/35)
    - I2C with 3.3V logic level (J8 pin header, J13,17 qwiic connector)
    - I2C with 5V logic level (J7 pin header)
    - internal used adresses:
        - 0x1C - Magnetometer part of the LSM9DS1 (U12)
        - 0x43 - FXL6408 port extender (IC 1)
        - 0x48 - ADS1115 (U4)
        - 0x6A - Accelerometer part of the LSM9DS1 (U12)
- CAN bus
    - Tranceiver (U2) + ESP32 integrated controler (IO
    - Termination resistor and sending messages can/must both be enabled with a jumper on J12
    - external connection J18
- Ethernet:
 - internal MAC, connected to LAN8720A on IO17,18,19,21,22,23,25,26,27
 - PHY-Reset controlled with FXL6408-GPI01
- IMU: 9 Axis, LSM9DS1 (U12). Magnetometer needs iron correction to be usable.
- Outputs
    - One H-bridge/motordriver with two VNH7070AS (U3/5), (PWM IO4, FXL6408-GPIO6/7 direction). External connected on J4
    - One H-bridge/motordriver with one VNH7070AS (U9), (PWM IO12, FXL6408-GPI04/5 direction), external connected on J3
    - One Relay (K2) controlled on FXL6408-GPI03, external connected on J3
    - One status LED (D2) controlled on FXL6408-GPI02
- Inputs
    - Three 15V tolerant (analog) inputs IO34, SENSOR_VN, SENSOR_VP, external connected on J1
    - Three 5V tolerant (analog) inputs on the ADS1115, first two cann be used to measure differential. Number four is hardwired to VCC/5V. External connected on J5
    - One Button (e.g. for entering configuration mode), on FXL6408-GPI00
- Connectors:
    - J1 - 6 pin PTSM header. 15V tolerant inputs and 12V for easy cabeling if used as switch
    - J2 - 2 Pin Uart
    - J3 - 7 pin PTSM header. Outputs of second H-bridge, two times ground (for using as two half bridges) and the three pins for the relay (comm, no, nc)
    - J4 - 4 pin CCA header. Power input and output of the first motor driver/h-bridge
    - J5 - 5 pin PTSM header. Three ADS1115 inputs, 5V and GND for easy cabeling (e.g. linear potentiometer)
    - J7 - 4 pin header. I2C 5V logic level + GND and 5V
    - J8 - 4 pin header. I2C 3V3 logic level + GND and 3V3
    - J9, J10, J11 - 8 pin header. Socket for the F9P
    - J12 - 2x2 horizontal pin header. Used for jumpers to enable CAN termination and/or CAN TX
    - J13, J17 - qwiic connector. I2C 3V3
    - J14 - micro USB connector. Can power 5V and 3V3 part of the PCB. Electrical not isolated! Used for programming the ESP32
    - J15 - RJ45 ethernet connector
    - J16 - D-Sub connector (male). RS232
    - J18 2 pin PTSM header. CAN bus
