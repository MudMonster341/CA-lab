# Question
# Take user input value for x and have a user defined array of length 4 . Then find out the value of the equation
# Evaluate : A[0]x^3  + A[1]x^2 + A[2]x^ + A[3]


.data
msga: .asciiz "the sum is:"
msgb: .asciiz "enter the value of x:"
array1: .word 1, 2, 3, 4
len: .word 4


.text
main:	la $a1,array1	#array1 address loaded 
	
	li $v0,4
	la $a0,msgb
	syscall		#printing msg to accept x value

	li $v0,5
	syscall
	move $s1,$v0	#getting the x value

	move $t1,$zero 	#setting sum to zero
	la $a1,array1	#loading adress of array

	lw $t2,12($a1)	#loading last element
	add $t1,$t1,$t2	#last element added A[3]
	 
	lw $t2,8($a1)	#loading second last element
	move $t3,$s1
	multu $t2,$t3	#A[2] * x
	mflo $t4
	add $t1,$t1,$t4	#added to sum

	lw $t2,4($a1)	#loading third last element
	move $t3,$s1
	multu	 $t3,$t3
	mflo $t3	# x*x stored in t3

	multu $t2,$t3	#A[1] * x*x
	mflo $t4
	add $t1,$t1,$t4	#added to sum

	lw $t2,0($a1)	#loading fourth last element
	move $t3,$s1
	multu $t3,$t3
	mflo $t3	# x*x*x stored in t3

	multu $t2,$t3	#A[1] * x*x*x
	mflo $t4
	add $t1,$t1,$t4	#added to sum

	li $v0,4	#syscall to print msga
	la $a0,msga	#loading address of msga into a0
	syscall

	li $v0,1
	move $a0,$t1	#printing sum 
	syscall

	li $v0,10
	syscall 
