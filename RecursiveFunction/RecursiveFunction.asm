.data 
out: .space 1024
str: .ascii "inja bagam\n"
.text
.globl main
main:
	li $v0, 5
	syscall
	move $s0, $v0#for n
	li $s2, 0 #result
	la $t0, out#address for out
	li $t1, 1 #for i
	li $t2, 1 # for index
	la $t9, str
	jal printCombinations
	
	move $a0, $s2
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall
	
printCombinations:
	
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $t1, 4($sp) #i
	sw $s0, 8($sp) 
	sw $t2, 12($sp) #index
	
	bnez  $s0, loop #shart avalie
	 
	lw $s1, 12($sp)
	subi $s1, $s1, 1
	sll $s5, $s1, 2
	add $s5, $s5, $t0
	sw $zero, 0($s5)
	addi $s2, $s2, 1
	j end_function
loop: 
	bgt $t1, $s0, end_function
	sll $t4, $t1, 2 #for addressing in array
	add $t4, $t0, $t4 #sum for lw
	sw $t1, 0($t4)
	addi $t2, $t2, 1 # index + 1
	sub $s0, $s0, $t1 # n - j
	
	jal printCombinations
	
	add $s0, $s0, $t1
	subi $t2, $t2, 1
	addi $t1, $t1, 1
	j loop
	
end_function:
	lw $ra, 0($sp)
	lw $t1, 4($sp) #i
	lw $s0, 8($sp) 
	lw $t2, 12($sp) #index
	addi $sp, $sp, 16
	
	jr $ra


