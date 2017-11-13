.data
	matrix1: .word 0:400
	matrix2: .word 0:400
	matrix:  .word 0:400
	string: .asciiz"the result is:\n"
	space: .asciiz" "
	enter: .asciiz"\n"
.text
	ori $t0, $0, 100
	li $v0,5
	syscall
	move $s0,$v0   #row == col
	move $t0,$0    #row counter  
	move $t1,$0    #col counter
	li $s1,0 #i
	li $s2,0 #j
	li $s3,0 #k
getmatrix1:
	li $v0,5
	syscall
	
	mult $t0,$s0
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	sw $v0,matrix1($t2)
	addi $t1,$t1,1
	blt $t1,$s0,getmatrix1
	move $t1,$0
	addi $t0,$t0,1
	blt $t0,$s0,getmatrix1
getmatrix2:
	li $v0,5
	syscall
	
	mult $t0,$s0
	mflo $t2
	add $t2,$t2,$t1
	sll $t2,$t2,2
	sw $v0,matrix2($t2)
	addi $t1,$t1,1
	blt $t1,$s0,getmatrix2
	move $t1,$0
	addi $t0,$t0,1
	blt $t0,$s0,getmatrix2
	
	
	
