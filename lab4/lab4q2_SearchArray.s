.data
msga: .asciiz "enter value to be found :"
array: .word 1,24,56,78,90,100,323,4326,57456,74554
len: .word 10
fd: .asciiz "value found"
nfd: .asciiz "value not found"

.text
main: 	li $v0,4
	la $a0,msga
	syscall

	li $v0,5
	syscall
	move $t2,$v0

	la $a0,array     
	lw $t1,len

up:	lw $t0,0($a0)
	beq $t0,$t2,found
	beq $t1,$zero,notfd
	addi $t1,$t1,-1
	addi $a0,$a0,4
	j up	

found: 	li $v0,4
	la $a0, fd
	syscall 

	li $v0 , 10
	syscall

notfd:	li $v0,4
	la $a0, nfd
	syscall 

	li $v0 , 10
	syscall
