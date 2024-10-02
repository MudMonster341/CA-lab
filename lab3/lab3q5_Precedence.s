.data
msga: .asciiz "enter a:"
msgb: .asciiz "enter b:"
msgc: .asciiz "enter c:"
msgd: .asciiz "enter d:"
msge: .asciiz "enter e:"

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

	li $v0,4
	la $a0,msgd
	syscall

	li $v0,5
	syscall
	move $t3,$v0

	li $v0,4
	la $a0,msge
	syscall

	li $v0,5
	syscall
	move $t4,$v0

	mul $t1,$t0,$t1
	div $t1,$t2
	mflo $t2
	div $t2,$t3
	mfhi $t3
	add $t4,$t4,$t3

	li $v0,1
	move $a0,$t4
	syscall

	li $v0,10
	syscall