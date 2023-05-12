	AREA lab_4, CODE, READONLY
	ENTRY
	EXPORT main
main
; Load the variables into registers
	MOV32 R1, #38
	MOV32 R2, #67
; Perform the logical AND operation
	AND R0,R1, R2
	
; Perform logical OR operation
    ORR  R3,R1, R2

; Perform logical NOR operation
    MVN  R4, R3

; Perform logical NAND operation
    MVN  R5, R0

; Perform logical XOR operation
    EOR  R6, R1, R2

; Perform logical XNOR operation
    MVN  R7, R6

STOP B STOP
    END
