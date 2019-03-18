.data
	a: byte. 'm', 'a', 'r', '0'

.text
	lui $t0, 0x1000
	addi $t1, $zero, '0'
	addi $t2, $zero, 'a'
	addi $t4, $t2, -1
	addi $t3, $zero, 'z'
	addi $t3, $t3, 1

while:
	lb $s0, 0($t0)
	slt $at, $s0, $t3
	beq $at, $zero, end_if

	slt $at, $t4, $s0
	beq $at, $zero, end_if

	sub $s0, $s0, $t2
	addi $s0, $s0, 'A'
	sb $s0, 0($t0)

end_if:
	addi $t0, $t0, 1
	bne $t1, $s0, while
