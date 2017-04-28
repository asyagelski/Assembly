.include "PWR_X_N.s"
.text
.global _start
_start:
	movia	sp, 0x01FFFFFF	#Initialize stack pointer at end of stack
	mov		r2, r0			#Initialize final answer
	addi	r2, r2, 1		#Set answer to 1
	movia	r3, ANS			#Initialize answer address
	movia	r5, X			#Initialize X
	ldw		r5, 0(r5)
	movia	r6, N			#Initialize N
	ldw		r6, 0(r6)
	beq		r6, r0, disp	#If N = 0, finish
	
	addi	sp, sp, -16		#Move sp up four spots
	stw		r2, 12(sp)		#Store temp answer in sp
	stw		r5, 8(sp)		#Store X in sp
	stw		r6, 4(sp)		#Store N in sp
	nextpc	r7				#Get next pc
	addi	r7, r7, 12		#Get next 3 instead
	stw		r7, 0(sp)		#Store ra in sp
	
	call PWR				#Call multiplication subroutine
	
	ldw		r2, 12(sp)		#Load answer from sp
	ldw		r9, 8(sp)		#Load X from sp
	ldw		r10, 4(sp)		#Load N from sp
	ldw		r31, 0(sp)		#Load ra from sp
	addi	sp, sp, 16		#Reset sp to top of stack
disp:
	stw		r2, 0(r3)		#Store answer
stop:
	br stop
.data
X:
.word 5						#X variable
N:
.word 2						#To the N variable
ANS:
.skip 4