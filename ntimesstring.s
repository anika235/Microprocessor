/*	area exam, code, readonly
	entry
	export main
main
	ldr r0, =s
	mov r1, #3
	bl concatanate_n
	
stop B stop

concatanate_n
	mov r2, r0		;current end_ptr of s will be in r2
	mov r6, #0		;len of str in r6
goto_end_loop
	ldrb r3, [r2], #1
	add r6, r6, #1
	
	cmp r3, #0
	bne goto_end_loop
	
	sub r2, r2, #1
	sub r6, r6, #1
	
	mov r4, #0		;i = 0
loop_outer  ;for counting n
	mov r3, r0
	mov r7, #0		;j = 0
loop_inner ; for counting the chars
	ldrb r5, [r3], #1
	strb r5, [r2], #1

	add r7, r7, #1
	cmp r7, r6
	blt loop_inner
	
	sub r2, r2, #1
	
	add r4, r4, #1
	cmp r4, r1
	blt loop_outer
	
	bx lr

	area taskData, DATA, readwrite,align=4
s 	DCB "queso"
	end
	*/