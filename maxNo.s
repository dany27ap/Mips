.text

main:
	addi $sp, $sp, -12
	addi $s0, $zero, 1
	sw $s0, 8($sp)
	addi $s0, $zero, 2
	sw $s0, 4($sp)
	addi $s0, $zero, 3
	sw $s0, 0($sp)
	jal max
	addi $sp, $sp, 12
	j out

max:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $fp, 4($sp)
	addi $fp, $sp, 12
	lw $t1, 0($fp)
	lw $t2, 4($fp)
	lw $t3, 8($fp)
	add $t4, $zero, $zero	#max
	blt $t1, $t2 switch1 	#t1 < t2 ? t4 = t1:t2
	add $t1, $zero, $t3
	blt $t1, $t2 switch1	# t1 < t3 ? t4 = t1:t3
	add $t4, $zero. $t1
switch1:
	add $t4, $t4, $t2

.end main