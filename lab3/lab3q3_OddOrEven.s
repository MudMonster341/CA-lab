.data
msga: .asciiz "enter Number:"
msgb: .asciiz "Odd Number"
msgc: .asciiz "Even Number:"
z: .word 0

.text
main: 	li $v0,4
	la $a0,msga
	syscall      #printing msg 

	li $v0,5
	syscall
	move $t0,$v0  #taking value

	li $t1,2
	div $t0,$t1
	mfhi $t2 # putting remainder in t2

	beq $t2,$zero,even      # if even will jump to even , other wise odd
	
	li $v0,4
	la $a0,msgb
	syscall
	j exit # prints Odd number

	
even:	li $v0,4
	la $a0,msgc
	syscall
	j exit # prints Even number
	
exit:	li $v0,10
	syscall