	area exam, code, readonly
    entry
	export main
	export largest 
		;find the value of max
main 
	LDR R0, =n 
	LDR R5, [R0]
	MOVS R1, #0 
	MOVS R2, #5
	MOVS R3, #0 ;save value of max 
	BL largest
stop B stop

largest
	
	LSL R6, R1, #2
	LDR R5, [R0, R6]
	CMP R5, R3
	BLE break
	MOV R3, R5
break
	ADD R1, R1, #1
	CMP R1, R2
	BLT largest

n DCD 5,10,15,20,-30
	END

	
