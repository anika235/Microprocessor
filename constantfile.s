	AREA helloconstant, CODE, READONLY
	ENTRY 
	EXPORT main 
main
	MOV r1, #X
	MOV r2, #Y
	MOV r3, #Z
	ADD r0,r1,r2;
	ADD r0, r0,r3;
Stop B Stop
X EQU 9
Y EQU 8
Z EQU 5
	END