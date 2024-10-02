.data
msga: .asciiz "enter x:"
msgb: .asciiz "enter y:"
z: .word 0

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

	multu $t0,$t1
	mflo $t2

	li $v0,1
	move $a0,$t2
	syscall

	li $v0,10
	syscall