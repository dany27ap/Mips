.data
	cout: .asciiz "Citeste sir: "
.text
main:
	lui $a0, 0x1000			#tipareste sir 
	addi $v0, $zero, 4
	syscall

	addi $a0, $a0, 13		#Citeste sir
	addi $a1, $zero, 13
	addi $v0, $zero, 8
	syscall

	add $v0, $zero, $zero
	jal length

	add $a0, $v0, $zero # tipareste lungimea
	addi $v0, $v0, 1
	syscall

	addi $v0, $zero, 10		#end program
	syscall

length:
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $t0, 8($sp)

	#Base case
	lb $t0, 0($a0)
	beq $t0, $zero, end_rec
	addi $a0, $a0, 1
	jal length
	addi $v0, $zero, 1



end_rec:
lw $ra, 0($sp)
lw $a0, 4($sp)
lw $t0, 8($sp)
addi $sp, $sp, 12

jr $ra

.end main