.data
msga: .asciiz "enter N:"
z: .word 0

.text
main: 	li $v0,4
	la $a0,msga
	syscall      #printing msg 

	li $v0,5
	syscall
	move $t0,$v0  #taking value

	move $t1,$zero # sum is t1
	move $t2,$zero # i variable in loop is t2	

loop:	ble $t0,$t2,exit
	addi $t2,$t2,1
	add $t1,$t1,$t2
	j loop

	
exit:	li $v0,1
	move $a0,$t1
	syscall	   # printing final value (int)

	li $v0,10
	syscall