.data
msga: .asciiz "enter value to be found :"
array: .word 1,2,3,5,6,7,8,10,3,11
len: .word 10
fd: .asciiz "va"
nfd: .asciiz "greatest value is:"

.text
main: 	la $a0,array     
	lw $t2,len

	lw $t0,0($a0)  # t0 is greatest
	addi $a0,$a0,4

up:	lw $t1,0($a0)
	beq $t2,$zero,end
	ble $t0,$t1,upd
	j down
	

upd:	move $t0,$t1
down:	addi $t2,$t2,-1
	addi $a0,$a0,4
	j up	

end:	li $v0,4
	la $a0, nfd
	syscall 

	li $v0,1
	move $a0,$t0
	syscall

	li $v0 , 10
	syscall
