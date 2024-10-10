.data

list: .word 20, 15, 12, 4, 3, 32, 54, 11, 86, 100
space: .ascii " "

 .text
 .globl main
 
  main:
  	la $t0, list
  	
  	li $t1, 0 #int i for out loop
  	
  	li $t3, 10 #size of array
  	li $s0, 0 #index when we want to print
  	la $s1, space
  	addi $t4, $t3, -1
  	
  out_loop:
  	bge $t1, $t3, end_sorting
  	li $t2, 0 #int j for in loop
  	in_loop:
  		bge $t2, $t4, increment_i
  		sll $t5, $t2, 2
  		add $t5, $t5, $t0
  		lw $t6, 0($t5)
  		lw $t7, 4($t5)
  		bgt $t6, $t7, swap
  		sw $t6, 0($t5)
  		sw $t7, 4($t5)
  		addi $t2, $t2, 1
  		j in_loop
  	swap:
  		move $t8, $t6
  		move $t6, $t7
  		move $t7, $t8
  		sw $t6, 0($t5)
  		sw $t7, 4($t5)
  		addi $t2, $t2, 1
  		j in_loop
  increment_i:
  	addi $t1, $t1, 1
  	j out_loop
  end_sorting:
  	beq $s0, $t3, end
  	sll $s2, $s0, 2
  	add $s2, $s2, $t0
  	lw $s3, 0($s2)
  	move $a0, $s3
  	li $v0, 1
  	syscall
  	la $a0, space
  	li $v0, 4
  	syscall
  	addi $s0, $s0, 1
  	j end_sorting
  	
  end:
  	li $v0, 10
  	syscall
  	
  	
  	
