.data
array: .word 1,2,3,4,5
len: .word 5

.text
main: 	la $a0,array
	lw $t1,len
	add $t4,$t4,$zero	

up:	lw $t0,0($a0)
	beq $t1,$zero,exit
	addi $t1,$t1,-1 
	add $t4,$t4,$t0
	addi $a0,$a0,4
	j up	
	

exit:	li $v0,1
	move $a0,$t4
	syscall

	li $v0,10
	syscall