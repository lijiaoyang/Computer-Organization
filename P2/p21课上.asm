#个人觉得自己在p2栽了个坑啊， 一定是因为周四的熬夜，上机的时候用这种方法浪费了大量时间也没做出来，
#我又实现了一遍，反正留我也没用了，送给大家当个资料看一下；
#题目大概是矩阵转置后相加，大概有两种思路一种是矩阵相加后转置，
#第二种是矩阵先转置再相加，此程序以第二种实现；（本人亲测得第一种方式容易的多）
#题目对输出还有其他要求，此程序并没有实现。
.data 
	array:.word 0:400
	s0:.asciiz "The result is:\n"
	space:.asciiz " "
	newline:.asciiz "\n"
.text 
#因为采用第二种方式所以原矩阵的行等于转置后的列，原矩阵的列等于转置后的行
	li $v0, 5
	syscall
	move $s0, $v0#get col
	
	li $v0, 5
	syscall
	move $s1, $v0#get row
	
	move $t0, $0#current row
	move $t1, $0#current col
	
getmatrix:
	li $v0, 5
	syscall
	
	mult $t0, $s1
	mflo $t2
	add $t2, $t2,$t1
	sll $t2, $t2,2
	sw $v0, array($t2)
	addi $t0, $t0, 1
	bne $t0, $s1, getmatrix#一列未输完前跳转，输入完一列后继续往下执行
	move $t0,$0
	addi $t1,$t1,1
	bne $t1, $s0,getmatrix#全部输满后往下执行
	
	move $t1, $0

addmatrix:
	li $v0, 5
	syscall
	
	mult $t0, $s1
	mflo $t2
	add $t2, $t2, $t1
	sll $t2, $t2, 2
	lw $t3, array($t2)
	add $t3, $t3, $v0
	sw $t3, array($t2)
	addi $t0, $t0, 1
	bne $t0, $s1, addmatrix#一列未加完前跳转，输入完一列后继续往下执行
	move $t0,$0
	addi $t1,$t1,1
	bne $t1, $s0,addmatrix#全部加满后往下执行
	
	move $t1, $0
	
		
	la $a0 s0
	li $v0, 4
	syscall
output:
	mult $t0, $s1
	mflo $t2
	add $t2, $t2,$t1
	sll $t2, $t2,2
	
	lw $a0, array($t2)
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	 
	addi $t1, $t1, 1
	blt $t1, $s0, output
	
	la $a0, newline
	li $v0,4
	syscall
	
	move $t1,$0
	addi $t0,$t0,1
	blt $t0, $s1,output
	
exit: 
	li $v0, 10
	syscall	
