.data
str1: .space 100           # Allocate space for str1 (100 bytes, enough for concatenation)
str2: .asciiz "string2"     # Second string to concatenate
dest: .asciiz "The concatenated string is:\n"  # Message to print before concatenation

.text
.globl main

main:
    # Initialize pointers
    la $t0, str1           # Load the base address of str1 into $t0
    la $t4, str2           # Load the base address of str2 into $t4

    # Print initial message
    li $v0, 4              # System call for printing a string
    la $a0, dest           # Load address of "The concatenated string is:" message
    syscall                # Print message

    # Loop1: Move to the end of str1
    li $s0, 0              # i = 0, index for str1
Loop1:
    add $t1, $t0, $s0      # Address of str1[i] in $t1
    lbu $t2, 0($t1)        # Load byte str1[i] into $t2
    beq $t2, $zero, out    # If we reach the null terminator, go to out
    addi $s0, $s0, 1       # Increment i
    j Loop1                # Repeat loop

out:
    # Loop2: Copy characters from str2 to the end of str1
    li $s1, 0              # j = 0, index for str2
Loop2:
    add $t1, $t0, $s0      # Address for the next position in str1
    add $t3, $t4, $s1      # Address of str2[j]
    lbu $a0, 0($t3)        # Load byte str2[j] into $a0
    beq $a0, $zero, end_concat # If we reach the null terminator of str2, end concatenation
    sb $a0, 0($t1)         # Store byte at the end of str1
    addi $s0, $s0, 1       # Increment index for str1
    addi $s1, $s1, 1       # Increment index for str2
    j Loop2                # Repeat loop

end_concat:
    # Add a null terminator at the end of the concatenated string
    add $t1, $t0, $s0      # Address for the null terminator
    sb $zero, 0($t1)       # Add null terminator to the end of str1

    # Print the concatenated string (str1)
    li $v0, 4              # System call for print string
    la $a0, str1           # Load address of str1 (now contains concatenated string)
    syscall                # Print concatenated string

    # Exit program
    li $v0, 10             # Exit system call
    syscall
