/*	area lab5, code, readonly
	entry
	export main
a dcd 2
c dcd 3
main
	ldr r0,	=a
	ldr r1, =c
	bl sum
stop b stop

sum
	ldr r2, [r0]
	ldr r3, [r1]
	add r4, r2,r3
	bx lr
	end
*/