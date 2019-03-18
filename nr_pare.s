.data 
	len: .word 3
	v: .word 2, 4, 5

.text
	lui $t0, 0x1000
	add $s0, $t0, $zero		#s0= len
	addi $t0, $t0, 4 	#t0 = &v
	add $s1, $zero, $zero	#s1 = index = 0
	add $2, $zero, $zero	#counter of pare no
	addi $s3, $zero, 1		#for and operation


for:
	lw $t1, 0($t0)
	and $t1, $t1, $s3
	bne $t1, $zero, dupa_if
	addi $s2, $s2, 1

dupa_if:
	addi $t0, $t0, 4
	addi $s1, $s1, 1
	bne $s1, $0, for