.data
pi:    .float 3.1415926535897924    # Constant value of pi
radius: .float 3.0                  # Input radius
area:   .float 0.0                  # Output area
msg_area: .asciiz "Area of the circle is: "

.text
.globl main

main:
    # Load radius
    l.s $f0, radius                 # Load address of radius
    mov.s $f1, $f0                # Load radius into $f1
    mul.s $f2, $f1, $f1            # Compute r^2

    # Load pi and compute area
    l.s $f3, pi                     # Load address of pi
    mov.s $f4, $f3               # Load pi into $f4
    mul.s $f5, $f2, $f4            # Area = pi * r^2
    s.s $f5, area                  # Store area in memory

    # Print area
    li $v0, 4                      # Print string syscall
    la $a0, msg_area               # Load message
    syscall

    li $v0, 2                      # Print float syscall
    l.s $f12, area                 # Load area
    syscall

    li $v0, 10                     # Exit syscall
    syscall
