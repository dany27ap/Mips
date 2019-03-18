.data 	
	promptText: .asciiz "(N = index of fibonacci array). N = "
	resultMessage: .asciiz "\nThe fibonacci of the index N is = "
	theInput: .word 0
	theOutput: .word 0

.text 
main:
	la $a0, promptText
	addi $v0, $zero, 1	#li $v0, 1
	syscall

	addi $v0, $v0, 5	#li $v0, 1
	syscall
	sw $v0, theInput
	move $a0, $v0	#store in a0 theInput

	jal fibonacciFunction
	move $t0, $v0	#save temporary result in t0
	sw $v0, theOutput

	la $a0, resultMessage
	li $v0, 4
	syscall

	move $a0, $t0	#display result
	li $v0, 1
	syscall

fibonacciFunction:
	#Base case
	#F(0) = 0
	#F(1) = 1

	li $t0, 1
	bgt $a0, $t0, recursive
	#n<=1 ret n
	move $v0, $a0
	jr $ra 

	#F(n) = F(n-1) + F(n-2)

recursive:
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)

	sub $a0, $a0, 1
	jal fibonacciFunction
	sw $v0, 8($sp)
	sub $a0, $a0, 1
	jal fibonacciFunction
	lw $t1, 8($sp)
	add $v0, $v0, $t1


	#undo stack
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 12
	jr $ra