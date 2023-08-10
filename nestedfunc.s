	area lab5, code, readonly
	entry
	export main
main
	ldr r0, =n 
	mov r1, #0 ; load index
	mov r2, #5 

loop
	lsl r3, r1, #2 ;left shift for loading index
	ldr r4, [r0, r3]
	
	bl prime
	
	add r1, r1, #1
	cmp  r1, r2
	blt loop
stop b stop

prime
	mov r5, #2
	cmp r4, r5 ; to find less than 2
	blt notprime 
	cmp r4, r5 ;if r4 = 2
	beq yesprime
	sub r6, r4, #1 ; loop to n-1
	
forloop
	cmp r5, r6 ; if num greater than r5
	bgt yesprime
	udiv r7, r4, r5 
	mul r8, r5, r7
	cmp r4, r8 
	beq notprime
	add r5, r5, #1
	b forloop
	
notprime 
	bx lr
	
yesprime 
	mov r9, r4
	bx lr
	
n dcd 5,6,7,8,9
	end