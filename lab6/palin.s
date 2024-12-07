.data
inp_str: .asciiz "madame"
yes: .asciiz "Palindrome"
no: .asciiz "Not palindrome"
rev_str: .space 50
.text
main:
	la $t0, inp_str      	# base address of inp_str in $a0
	la $a1, rev_str 	# base address of rev_str in $a1
	li $s0, 0	  	# i = 0
	li $s1, 0
	li $s2, 0
	li $t3,	2

Loop1:	add $t1,$s0,$t0		# address of inp_str[i] in $t1
	lbu $t2, 0($t1) 	# $t2 = inp_str[i]
	beq $t2,$zero,skibidi	# if inp_str[i] == 0, go to out
	addi $s0, $s0,1 	# i = i + 1 
	j Loop1			# go to Loop1

skibidi:	move $t1, $s0
	div $t1, $t3
	mflo $s2
	addi $s2, $s2, 1
	
Loop2:	addi $s0, $s0, -1	# i = i -1 points to last char
	add $t1,$s0,$t0		# address of inp_str[i] in $t1
	add $t2,$s1,$t0
	lbu $a0, 0($t1)		# $a0 = inp_str[i]
	lbu $a1, 0($t2)
	bne $a1, $a0, notequal
	addi $s1, $s1, 1
	add $s2, $s2, -1

	beq $s2, $zero, equal	# if i = 0 then exit
	j Loop2			# go to Loop2
	

equal:	li $v0, 4
	la $a0, yes
	syscall
	j exit


notequal:	li $v0, 4
		la $a0, no
		syscall

exit:	li $v0, 10              #terminating
    	syscall 