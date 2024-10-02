.data
msga: .asciiz "enter a:"
msgb: .asciiz "enter b:"
msgc: .asciiz "enter c:"

.text
main: 	li $v0,4
	la $a0,msga
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0,4
	la $a0,msgb
	syscall

	li $v0,5
	syscall
	move $t1,$v0

	li $v0,4
	la $a0,msgc
	syscall

	li $v0,5
	syscall
	move $t2,$v0

	sub $t3,$t0,$t1
	addi $t2,-5
	add $t4,$t3,$t2

	li $v0,1
	move $a0,$t4
	syscall

	li $v0,10
	syscall