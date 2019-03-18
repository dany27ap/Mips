.data 	
	len: .word 5
	v: .word 5, 4, 3, 2, 1

.text
	lui $t0, 0x1000
	lw $s0, 0($t0)	#length
	addi $s0, $s0, -1
	addi $t0, $t0, 4
	addi $t2, $zero, $t0	#initial state of t0
	add $t3, $zero, $zero	#t3 = ok = 0

while:
	addi $t3, $t3, 1
	add $t0, $zero, $t2
	add $v0, $zero, $zero 	#index

for:
	lw $s1, 0($t0)
	lw $s2, 4($t0)
	slt $at, $1, $s2
	beq $at, $zero, end_if

	add $s3, $zero, $s1
	add $s1, $zero, $s2
	add $s2, $zero, $s3
	add $t3, $zero, $zero

	sw $s1, 0($t0)
	sw $s2, 4($t0)

end_if:
	addi $v0, $v0, 1
	addi $t0, $t0, 4
	bne $s0, $v0, while