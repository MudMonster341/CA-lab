.data
array: .word 1,24,56,78,90,100,323,4326,57456,74554
len: .word 10

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