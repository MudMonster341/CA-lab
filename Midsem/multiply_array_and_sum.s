# Question
# Take two arrays of len 3 each , multiply each corresponding to the position and add all the multiplied values
# Ex : as seen below 
# (1*4)+(2*5)+(3*6) = 32 (final answer)


.data
msga: .asciiz "the sum after multiplication is:"
array1: .word 1, 2, 3
array2: .word 4, 5, 6
len: .word 3


.text
main:	lw $t0,len 	#len of array put into t0
	la $a1,array1	#array1 address loaded 
	la $a2,array2	#array2 address loaded 
	
	move $t3,$zero 	#t3 is the sum
	
up:	beq $t0,$zero,exit

	lw $t1,0($a1)	#load value from array 1
	lw $t2,0($a2)	#load value from array 2

	multu $t1,$t2	#mul stores quotient in mflo and mfhi (here same value)
	mflo $t4	#store value after multiplication in t4

	add $t3,$t3,$t4	#add to sum

	addi $a1,$a1,4	#next element of array1
	addi $a2,$a2,4	#next element of array2
	addi $t0,$t0,-1	#decrement len (counter)	

	j up	 

exit:	li $v0,4	#syscall to print msga
	la $a0,msga	#loading address of msga into a0
	syscall

	li $v0,1
	move $a0,$t3	#printing sum 
	syscall

	li $v0,10
	syscall 
