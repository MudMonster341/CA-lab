.data
msg: .byte 56

.text
main: 	li $v0,1
	lb $a0, msg
	syscall 

	li $v0 , 10
	syscall