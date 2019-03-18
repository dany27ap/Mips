.data 
	value: .word 0x99889988

.text
main:
	lui $t0, 0x1000
	lw $a0, 0($t0)

	jal counter
.end main

counter:
	addi $t0, $zero, 32
	addi $t1, $zero, 1
	add $v0, $zero, $zero

repeat:
	and $t2, $a0, $t1
	beq $t2, $zero increment
	addi $v0, $v0, 1

increment:
	sll $t1, $t1, 1
	addi $t0, $t0, -1
	bne $t0, $zero, repeat

	jr $ra 
.end counter