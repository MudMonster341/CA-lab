.data
array: .word 1,2,3,4,5,6,7,8
len: .word 8

.text
main: 	la $a0,array
	lw $t0,len		#t0 is count
	add $t4,$t4,$zero	#sum is in t4	

	lw $t1,0($a0) 		#t1 is biggest element
	addi $a0,$a0,4
	addi $t0,$t0,-1 
	lw $t2,0($a0)		#t2 is second biggest element 

up:	addi $a0,$a0,4
	addi $t0,$t0,-1
	lw $t3,0($a0)	#t3 
	beq $t0,$zero,exit
	
	ble $t3,$t1,second	#checks if t3 lesser than first element
	move $t2,$t1		#first largest element becomes second
	move $t1,$t3		#t3 new element becomes largest 
	j up

second:	ble $t3,$t2,up		#checks if t3 lesser than second element . if lesser than theh loops back up
	move $t2,$t3
	j up	
	

exit:	li $v0,1
	move $a0,$t2
	syscall

	li $v0,10
	syscall