FIBONACCI:
	#Loading Variables
	ldw		r8, 16(sp)		#Load temp answer from sp
	ldw		r9, 12(sp)		#Load N from sp
	ldw		r10, 8(sp)		#Load f(n - 2) from sp
	ldw		r11, 4(sp)		#Load f(n - 1) from sp
	ldw		r31, 0(sp)		#Load temp pc from sp
	addi	sp, sp, 20		#Move to top of stack
	
	beq		r9, r0, FIN		#If N = 0 in current loop, finish
	
	#Sophisticated Algorithm
	add		r8, r10, r11	#fib(n) = fib(n - 1) + fib(n - 2)
	mov		r10, r11		#fib(n - 2) = fib(n - 1)
	mov		r11, r8			#fib(n - 1) = fib(n)
	addi	r9, r9, -1		#Decrement counter
	
	#Storing Variables
	addi	sp, sp, -20		#Add 5 spaces to stack
	stw		r8, 16(sp)		#Store answer in sp
	stw		r9,	12(sp)		#Store N in sp
	stw		r10, 8(sp)		#Store f(n - 2) in sp
	stw		r11, 4(sp)		#Store f(n - 1) in sp
	stw		r7, 0(sp)		#Store temp pc in sp
	
	call FIBONACCI
	
FIN:
	addi	sp, sp, -20		#Add 5 spaces to stack
	stw		r8, 16(sp)		#Store answer in sp
	stw		r9,	12(sp)		#Store N in sp
	stw		r10, 8(sp)		#Store f(n - 2) in sp
	stw		r11, 4(sp)		#Store f(n - 1) in sp
	stw		r7, 0(sp)		#Store temp pc in sp
	ret