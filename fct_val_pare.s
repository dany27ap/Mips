.data 
	len: .word 5
	v: .word 1, 2, 3, 4, 5

.text
main:

	addi $sp, $sp, -8
	lui $t0, 0x1000
	lw $t1, 0($t0)		#t1 = len
	addi $t0, $t0, 4
	lw $t2, 0($t0)		#t2 = &v
	sw $t1, 0($sp)
	sw $t2, 4($sp)
	jal count
	addi $sp, $sp, 8
	j out
.end main

count:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $fp, 4($sp)
	addi $fp, $sp, 12
	lw $t0, -12($fp)
	lw $t1, 0($fp)
	lw $t2, 4($fp)
	