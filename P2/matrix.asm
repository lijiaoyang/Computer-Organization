.data
	matrix:.word 0:256
.text
	li $t0,16#row
	li $t1,16#col
	li $s0,0#s0 is row counter
	li $s1,0#s1 is col counter
	li $s2,0#s2 is the stored number
	
for:
	mult $s0,$t1  #让行计数器乘以它的列
	mflo $t2
	add $t2,$t2,$s1 #add col counter
	sll $t2,$t2,2
	bne $t2,$0,judgefirst
	judgefirst: addi $t2,$t2,4096  #first address is 4096
	sw $s2,matrix($t2)#store s2
	addi $s2,$s2,1
	addi $s0,$s0,1
	bne $s0,$t0,for
	move $s0,$0 #已经输完一列，需要换一列，所以行计数器变为0
	addi $s1,$s1,1
	bne $s1,$t1,for
	move $s1,$0
	move $s1,$0
	li $t0,0
	li $t1,0
	li $t2,0
end:
	li $v0,10
	syscall
	

	
