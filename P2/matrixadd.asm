.data
	matrix:.word 0:400
	space:.asciiz" "
	enter:.asciiz"\n"
	string:.asciiz"the result is:\n"
.text
	li $v0,5
	syscall
	move $s0,$v0 #row
	li $v0,5
	syscall
	move $s1,$v0 #col
	li $v0,5
	syscall
	move $s2,$v0 #the number of matrix
	move $t0,$0 #row counter
	move $t1,$0 #col counter
getmatrix:
	li $v0,5
	syscall
	
	mult $t0,$s1
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	sw $v0,matrix($t2)
	addi $t1,$t1,1
	bne $t1,$s1,getmatrix
	move $t1,$0
	addi $t0,$t0,1
	bne $t0,$s0,getmatrix

	li $t4,1
	move $t3,$t4 #t3 is stored matrix
	move $t2,$0
	move $t0,$0
	beq $s2,$t4,output	
addmatrix:
	li $v0,5
	syscall
	
	mult $t0,$s1
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	lw $t6,matrix($t2)
	add $t5,$v0,$t6
	sw $t5,matrix($t2)
	addi $t1,$t1,1
	bne $t1,$s1,addmatrix
	move $t1,$0
	addi $t0,$t0,1
	bne $t0,$s0,addmatrix
	move $t2,$0
	move $t0,$0
	move $t5,$0
	addi $t3,$t3,1
	bne $t3,$s2,addmatrix 	
	
	la $a0,string
	li $v0,4
	syscall
output:
	mult $t0,$s1
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	lw $a0,matrix($t2)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	addi $t1,$t1,1
	blt $t1,$s1,output
	li $t7,1	
	sub $t6,$s0,$t0
	bne $t6,$t7,printenter	
	j end
printenter:
	la $a0,enter
	li $v0,4
	syscall
	move $t1,$0
	addi $t0,$t0,1
	blt $t0,$s0,output
	
end:
	li $v0,10
	syscall
	
	
	
	

	
	




	
	
	
	
	
	
	
	
	
	
