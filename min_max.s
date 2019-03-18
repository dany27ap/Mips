.data 
	len: .word 5
	v: .word 1, 2, 3, 4, 5

.text
	lui $t0, 0x1000
	lw $s0, 0($t0)			#s0 = len
	addi, $t0, $t0, 4 		#t0 = new word
	lw $t1, 0($t0)
	addi $s1, $1, $zero		#s1 = min
	addi $s2, $t2, $zero 	#s2 = max
	addi $s3, $zero, 1		#s3 = t0[1]
	addi $t0, $t0, 4		#t0[1] = t0[2]

for:
	lw $t2, 0($t0)
	addi $t0, $t0, 4	#t0[2] = t0[3]
	slt $at, $t2, $s1
	beq $at, $zero, dupa_if
	add $s1, $zero, $t2 

dupa_if:
	slt $at, $s2, $t2
	beq $at, $zero, dupa_if2
	add $s2, $t2, $zero

dupa_if2:
	addi $s3, $s3, 1
	bne $s3, $s0, for


