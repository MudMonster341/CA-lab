.data
x:  .word   2
pow:    .word   3

.text
.globl main

main:
    lw $a1,x
    lw $a2,pow
    jal power
    move $a0,$v0
    li $v0,1
    syscall
    li $v0,10
    syscall

power:
    bnez $a2,rec
    li $v0,1
    jr $ra

rec:
    addi $sp,$sp,-4
    sw $ra,0($sp)
    addi $a2,$a2,-1
    jal power
    move $t0, $v0
    mul $v0,$a1,$t0
    addi $sp,$sp,4
    lw $ra,0($sp)
    jr $ra

.end main