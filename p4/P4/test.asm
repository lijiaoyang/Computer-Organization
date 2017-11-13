

ori $t1,$zero,1		# t1 =  1
ori $t2,$zero,4		# t2 = 4
ori $t0,$zero,14		# t0 =5 times
ori $a0,$zero,1		# n 
ori $a1,$zero,0		#address

while:
	beq $a0,$t0,endwhile		#n<=5
	jal f
	sw $v0,0($a1)
	addu $a1,$a1,$t2
	addu $a0,$a0,$t1
	beq $zero,$zero,while

multi:
	addu $s0,$zero,$a0
	addu $s1,$zero,$v0
	while1:
		beq	$s0,$t1,endwhile1
		addu $v0,$v0,$s1
		subu $s0,$s0,$t1
		beq $zero,$zero,while1
	endwhile1:
	jr $ra
f:
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	beq $a0,$t1,return
	subu $a0,$a0,$t1
	jal f
	lw $a0,4($sp)
	jal multi
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
	
return:	addu $v0,$zero,$t1
		lw $ra,0($sp)
		lw $a0,4($sp)
		addu $sp,$sp,8
		jr $ra
endwhile: