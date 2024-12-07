.data
a:     .float 5.0                 # Coefficient a
d:     .float 4.0                 # Coefficient b
c:     .float 3.0                 # Coefficient c
x:     .float 2.0                 # Input x
result: .float 0.0                # Result of the polynomial
msg_poly: .asciiz "Polynomial output is: "

.text
.globl main

main:
    # Load x
    la $t0, x                     # Load address of x
    l.s $f0, 0($t0)               # Load x into $f0
    mul.s $f1, $f0, $f0           # Compute x^2, store in $f1

    # Compute ax^2
    la $t1, a                     # Load address of a
    l.s $f2, 0($t1)               # Load a into $f2
    mul.s $f3, $f2, $f1           # ax^2 = a * x^2, store in $f3

    # Compute bx
    la $t2, d                     # Load address of b
    l.s $f4, 0($t2)               # Load b into $f4
    mul.s $f5, $f4, $f0           # bx = b * x, store in $f5

    # Add ax^2 + bx
    add.s $f6, $f3, $f5           # ax^2 + bx, store in $f6

    # Add c
    la $t3, c                     # Load address of c
    l.s $f7, 0($t3)               # Load c into $f7
    add.s $f8, $f6, $f7           # ax^2 + bx + c, store in $f8
    s.s $f8, result               # Store result in memory

    # Print result
    li $v0, 4                     # Print string syscall
    la $a0, msg_poly              # Load message
    syscall

    li $v0, 2                     # Print float syscall
    l.s $f12, result              # Load result
    syscall

    li $v0, 10                    # Exit syscall
    syscall

