/*	AREA lab_4, CODE, READONLY
	ENTRY
	EXPORT main
var1  DCD  0x12345678
; Load the address of my_var into R0
main
	LDR R1, =var1
	LDR R0, [R1]

; Perform a logical shift right (LSR) by 8 bits and store the result in R1
	LSR R1, R0, #8
; Perform an arithmetic shift right (ASR) by 8 bits and store the result in R2	
	ASR R2, R0, #8
; Perform a logical shift left (LSL) by 8 bits and store the result in R3
	LSL R3, R0, #8
	
STOP B STOP
    END
*/