.data
newline: .asciiz "\n"

.text
# Main procedure for Fibonacci series
main:
   
    li $t4, 10             # Load n (number of Fibonacci terms to generate)

    jal fibonacci          # Jump and link to fibonacci procedure

    li $v0, 10             # Exit program
    syscall

# Fibonacci series procedure
fibonacci:
    li $t0, 0              # Initialize first term, a = 0
    li $t1, 1              # Initialize second term, b = 1

    li $v0, 1
    move $a0, $t0
    syscall                # Print first term (0)
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 1
    move $a0, $t1
    syscall                # Print second term (1)
    li $v0, 4
    la $a0, newline
    syscall

    li $t2, 2              # Start loop counter at 2

fib_loop:
    bge $t2, $t4, fib_end  # If counter reaches n, end loop
    add $t3, $t0, $t1      # c = a + b
    move $t0, $t1          # Update a = b
    move $t1, $t3          # Update b = c

    li $v0, 1
    move $a0, $t3
    syscall                # Print current Fibonacci term

    li $v0, 4
    la $a0, newline
    syscall

    addi $t2, $t2, 1       # Increment counter
    j fib_loop             # Repeat loop

fib_end:
    jr $ra                 # Return to caller