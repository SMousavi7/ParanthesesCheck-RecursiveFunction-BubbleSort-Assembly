.data
buffer: .space 32
parantez_baz: .ascii "("
parantez_baste: .ascii ")"
str_1: .asciiz "Yes"
str_2: .asciiz "No"
str_check: .ascii "\n"

.text
.globl main
main:

	li $v0, 8
	la $a0, buffer
	li $a1, 32
	move $t0, $a0 
	syscall
	lb $t1, 0($t0) 
	la $t2, parantez_baz
	la $t3, parantez_baste
	la $t4, str_check
	lb $t2,($t2)	
	lb $t3,($t3)
	lb $t4,($t4)
	li $s0, 0 #counter
	li $t5, 0 #for i
	
loop:
	add $t7, $t5, $t0
	lb $t6, 0($t7)
	beq $t6, $t4, end_loop
	beq $t6, $t3, minos_counter
	addi $s0, $s0, 1
	addi $t5, $t5, 1
	j loop
	minos_counter:
	addi $s0, $s0, -1
	bltz $s0, not_valid
	addi $t5, $t5, 1
	j loop

end_loop:
	bgtz $s0, not_valid
	la $a0, str_1
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	not_valid:
	la $a0, str_2
	li $v0, 4
	syscall
	li $v0, 10
	syscall
