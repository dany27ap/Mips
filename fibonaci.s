.data 

.text
.fib:
	bgt $a0, 1, fib_recurse
	move $v0, $a0
	jr $ra

fib_recurse:
	sub $sp, $sp, 
	sw $ra, 0($sp)

	sw $a0, 4($sp)
	addi $a0, $a0, -1
	jal fib
	lw $a0, 4($sp)
	sw $v0, 8($sp)
	