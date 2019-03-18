sum:
sub $sp, $sp, 8
sw $ra, 0($sp)
sw $a0, 4($sp)

	beq $a0, $zero, isZero
	jal sum
	add $v0, $v0, $a0
	sub $a0, $a0, 1

isZero:
lw ...
...
jr $ra