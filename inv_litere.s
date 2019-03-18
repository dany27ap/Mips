.data 
	mesaj: .asciiz "Introdu un sir de caractere: "
	cuvant: .asciiz "a"
.text
main:
	lui $a0, 0x1000
	addi $v0, $zero, 4
	syscall

	addi $a0, $a0, 30
	addi $a1, $zero, 32
	addi $v0, $zero, 8
	syscall

	jal inv


inv:
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $t0, 8($sp)

	#base case
	lb $t0, 0($a0)
	beq $t0, $zero sfarsit
	addi $a0, $a0, 1
	jal inv
	addi $v0, $zero, 11
	move $a0, $t0
	syscall

sfarsit:
lw $ra, 0($sp)
lw $a0, 4($sp)
lw $t0, 8($sp)
addi $sp, $sp, 12
jr $ra
