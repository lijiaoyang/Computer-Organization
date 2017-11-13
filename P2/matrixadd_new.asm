.data
	matrix:.word 0:400
	string:.asciiz"the result is:\n"
	enter:.asciiz"\n"
	space:.asciiz" "
.text
	li $v0,5
	syscall
	move $s0,$v0 #row
	li $v0,5
	syscall
	move $s1,$v0 #col
	li $v0,5
	syscall
	move $s4,$v0 #the number of add matrix
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
	move $t0,$0
	move $t2,$0
	li $t7,0
	li $t6,1
addmatrix:
	li $v0,5
	syscall
	
	mult $t0,$s1
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	lw $s2,matrix($t2)
	add $s3,$s2,$v0
	sw $s3,matrix($t2)
	addi $t1,$t1,1
	bne $t1,$s1,addmatrix
	move $t1,$0
	addi $t0,$t0,1
	bne $t0,$s0,addmatrix
	move $t0,$0
	move $t2,$0
	addi $t7,$t7,1
	sub $t5,$s4,$t7
	bne $t5,$t6,addmatrix
	
	
	
	
	
	
	
	
	