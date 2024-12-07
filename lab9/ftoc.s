.data
fahr:      .float 100.0            # Fahrenheit temperature input
celsius:   .float 0.0             # Output Celsius temperature
factor:    .float 0.5555556         # Conversion factor (5/9)
thirty_two: .float 32.0           # Constant value for 32
msg_temp:  .asciiz "Temperature in Celsius is: "

.text
.globl main

main:
    # Load fahr and subtract 32.0
    l.s $f0, fahr                  # Load address of fahr
    mov.s $f1, $f0               # Load fahr into $f1
    l.s $f2, thirty_two            # Load address of 32.0
    mov.s $f3, $f2               # Load 32.0 into $f3
    sub.s $f4, $f1, $f3           # fahr - 32.0

    # Multiply by factor (5.0 / 9.0)
    l.s $f5, factor                # Load address of factor
    mov.s $f6, $f5               # Load factor into $f6
    mul.s $f7, $f4, $f6           # Celsius = factor * (fahr - 32.0)
    s.s $f7, celsius              # Store Celsius in memory

    # Print Celsius
    li $v0, 4                     # Print string syscall
    la $a0, msg_temp              # Load message
    syscall

    li $v0, 2                     # Print float syscall
    l.s $f12, celsius             # Load Celsius
    syscall

    li $v0, 10                    # Exit syscall
    syscall
