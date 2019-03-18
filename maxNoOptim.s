.text
main:
	addi $sp, $sp, -20
	addi $s0, $zero, 1
	sw $s0, 16($sp)
	addi $s0, $zero, 2
	sw $s0, 12($sp)
	addi $s0, $zero, 3
	sw $s0, 8($sp)
	addi $s0, $zero, 4
	sw $s0, 4($sp)
	addi $s0, $zero, 5
	sw $s0, 0($sp)
	jal maxim
	addi $sp, $sp, 20
	j out
.end main

maxim:
	add $sp, $sp, -12
	sw $ra, 8($sp)
	sw $fp, 4($sp)
	addi $fp, $sp, 12
	lw $v0, 16($fp)
	lw $s1, 12($fp)
	blt $s1, $v0, dupa1
	add $v0, $s1, $zero

dupa1:
	lw $s1, 8($fp)
	blt $s1, $v0, dupa2
	add $v0, $s1, $zero

dupa2:
	lw $s1, 4($fp)
	blt $s1, $v0, dupa3
	add $v0, $s1, $zero

dupa3:
	lw s1, 0($fp)
	blt $s1, $v0, dupa4
	add $v0, $s1, $zero

dupa4:
	lw $fp, 4($sp)
	lw $ra, 8($sp)
	sw $v0, 0($sp)
	addi $sp, $sp, 12
	jr $ra
.end maxim

