.data
msga: .asciiz "enter Number:"

.text
main: 	li $v0,4
	la $a0,msga
	syscall      #printing msg 

	li $v0,5
	syscall
	move $t0,$v0  #taking value

	li $t1,10
	li $t3,0 # sum of digits

loop:	ble $t0,$zero,exit
	div $t0,$t1
	mfhi $t2  # putting remainder in t2
	mflo $t0  # putting quotient back into t0
	add $t3,$t3,$t2
	j loop
	

exit:	li $v0,1
	move $a0,$t3
	syscall

	li $v0,10
	syscall