	AREA lab_4, CODE, READONLY
	ENTRY
	EXPORT main
	EXPORT average
main
	LDR R0, =n
	LDR R5, [R0] ; number of values to average
	MOVS R1, #0   ; index
	MOVS R2, #5   ; size
	MOVS R3, #0   ; average 
average
	LSL R6, R1, #2 ; index load
	LDR R5, [R0, R6] 
	ADD R3, R3, R5  
	ADD R1, R1, #1  ;index change
	CMP R1, R2 ;comparison
	BLT average ;branch less than
	SDIV R3, R3, R2 ;signed integer division 
stop B stop
n DCD 5,10,15,20,25
	END
