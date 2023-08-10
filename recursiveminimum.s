/*	area lab5, code, readonly
	entry
	export main
main
	ldr r0, =n
	mov r1, #0
	mov r2, #5
	mov r6, #100
	bl recursive 
	mov r0, r6 ; save min in r0
stop b stop

recursive
	cmp r1, r2
	beq minimum 
	ldr r3, [r0]; load the value
	push {lr, r3}; to check the current value
	add r1, r1, #1
	add r0, r0, #4
	bl recursive
	pop {lr, r3};pop the value
	cmp r3, r6 
	bge minimum 
	mov r6, r3
	
	
minimum 
	bx lr
	
n dcd 5, 6, 7, 8 ,9
	end
	*/