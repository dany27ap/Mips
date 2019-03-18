.data 
	len: .word 5
	v: .word 1, 2, 3, 4, 5
	w: .word 0, 0, 0, 0, 0

.text
	lui $t0, 0x1000
	lw $t1, 0($t0)			#t1 = len
	addi, $t0, $t0, 4 		#t0 = new word
	add $v0, $zero, $zero	#v0 = counter
	add $t2, $t0, $zero		#t2 = &v

for:
	addi $t2, $t2, 4	$t2 = v
	addi $v0, $v0, 1
	bne $v0, $t1, for
	add $v0, $zero, $zero	#reset counter

for1:
	lw $t3, 0($t2)	#t3 = &w
	addi $t0, $t0, 4
	sw $t3, 0($t2)
	addi $t2, $t2, 4
	addi $v0, $v0, 1
	bne $v0, $t1, for1

	add $v0, $zero, $zero

for2:
	lw $s1, 0($t0)
	addi $v0, $v0, 1
	addi $t0, $t0, 4
	bne $v0, $t1, for2


