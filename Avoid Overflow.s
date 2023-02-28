	AREA lab_4, CODE, READONLY
	ENTRY
	export main
	export underflow
	export overflow
		
main
underflow	
	MOV R0, #8
	MOV R1, #9
	
	ADD R2, R1, R0
	SUB R3, R0, R1 
	MUL R4, R0, R1 
	UDIV R5, R0, R1 
overflow	
	MOV R0, #0xFFFFFFFF
	MOV R1, #0x00000FFF
	
	ADD R2, R1, R0
	SUB R3, R0, R1 
	MUL R4, R0, R1 
	UDIV R5, R0, R1 
STOP B STOP
	END