	AREA lab_4, CODE, READONLY
    ENTRY
	EXPORT main
	EXPORT average
main 
	LDR R0, =n
	LDR R5, [R0]
	MOVS R1, #0
	MOVS R2, #5
	MOVS R3, #0 ; max
	BL average
	MOVS R3, #1056
stop B stop

average
	LSL R6, R1, #2
	LDR R5, [R0, R6]
	CMP R5, R3
	BLE break
	MOV R3, R5
break
	ADD R1, R1, #1
	CMP R1, R2
	BLT average ;branch less than
	BX LR; branch to link register return to caller

n DCD 5,10,15,20,25
	END
	
