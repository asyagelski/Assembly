PWR:
	#Loading Variables
	ldw		r8, 12(sp)		#Load temp answer from sp
	ldw		r9, 8(sp)		#Load X from sp
	ldw		r10, 4(sp)		#Load N from sp
	ldw		r31, 0(sp)		#Load ra from sp
	addi	sp, sp, 16		#Reset sp to top of stack
	
	beq		r10, r0, FIN	#If N = 0 in current loop, finish
	
	#Sophisticated Algorithm
	mul		r8, r8, r9		#Multiply X by current answer
	addi	r10, r10, -1	#Decrement counter
	
	#Storing Variables
	addi	sp, sp, -16		#Move sp up four spots
	stw		r8, 12(sp)		#Store answer in sp
	stw		r9, 8(sp)		#Store X in sp
	stw		r10, 4(sp)		#Store N in sp
	stw		r7, 0(sp)		#Store ra in sp
	
	call PWR				#Call subroutine
	
FIN:
	addi	sp, sp, -16		#Move sp up four spots
	stw		r8, 12(sp)		#Store answer in sp
	stw		r9, 8(sp)		#Store X in sp
	stw		r10, 4(sp)		#Store N in sp
	stw		r7, 0(sp)		#Store ra in sp
	ret