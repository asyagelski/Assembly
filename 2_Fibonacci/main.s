.include "FIBONACCI.s"
.text
.global _start
_start:
	movia	sp, 0x01FFFFFF	#Initialize stack pointer at end of stack
	mov		r2, r0			#Initialize final answer
	movia	r3, FIB_N		#Initialize answer address
	movia	r4, N			#Initialize N
	ldw		r4, 0(r4)
	movi	r5, 2			#Temp flag			
	ble		r4, r5, done1	#If N <= 1, answer is 1 or 0
	movi	r5, 0			#fib(0) = 0
	movi	r6, 1			#fib(1) = 1
	addi	r4, r4, -2		#First two cases taken care of, so subtract 2
	
	addi	sp, sp, -20		#Move sp up five spots
	stw		r2, 16(sp)		#Store temp answer in sp
	stw		r4, 12(sp)		#Store N in sp
	stw		r5, 8(sp)		#Store f(n - 2) in sp
	stw		r6, 4(sp)		#Store f(n - 1) in sp
	nextpc	r7				#Get next pc
	addi	r7, r7, 12		#Get next 3 instead
	stw		r7, 0(sp)		#Store temp pc in sp
	
	call FIBONACCI
	
	ldw		r2, 16(sp)		#Load answer from sp
	ldw		r4, 12(sp)		#Load N from sp
	ldw		r5, 8(sp)		#Load f(n - 2) in sp
	ldw		r6, 4(sp)		#Load f(n - 1) in sp
	ldw		r31, 0(sp)		#Load pc in sp
	addi	sp, sp , 20		#Reset sp to top of stack
	br disp
done1:
	beq		r4, r0, done2	#If N = 0, answer is 0
	movi	r2, 1			#If N = 1 or 2, answer is 1
	br disp
done2:
	movi	r2, 0			#If N = 0, answer is 0
	br disp
disp:
	stw		r2, 0(r3)		#Store answer
stop:
	br stop
.data
N:
.word 4
FIB_N:
.skip 4