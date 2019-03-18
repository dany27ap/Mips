.data 
	value: .word 1,2,3,4,5
	len: .word 5

.text
main:
	la $s0, value
	la $s1, len
	lw $s1, 0($s1)
	jal counte_ones_array
	j out

count_one:
	addi $t0, $zero, 32
	addi $t1, $zero, 1
	add $v0, $zero, $zero

repeat:
	and $t2, $a0, $t1
	beq $t2, $zero, isZero
	addi $v0, $v0, 1

isZero:
	sll $t1, $t1, 1
	addi $t0, $t0, -1
	bne $t0, $zero, repeat
	jr $ra 
.end count_one

counte_ones_array:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $v1,$zero, $zero

for:
	lw $a0, 0($s0)
	jal count_one
	add $v1, $v1, $v0
	addi $s0, $s0, 4
	addi $s1, $s1, -1
	bne $s1, $zero, for

end_for:
	add $v0, $v1, $zero
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

.end counte_ones_array