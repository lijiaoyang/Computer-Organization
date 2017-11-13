.data
 size:.word 1000
 array:.space 4000
 space:.asciiz  " "     
 n: .asciiz "\n"
 head: .asciiz "The prime numbers are:\n"
.text
	la  	$s1, array        	# load address of array
        la   	$s6, size       	# load address of size variable
        lw   	$s6, 0($s6)      	# load array size
	
	li	$s2,10
	li	$t1,1			# $t1 = 1 $t2 = 1000	
	li	$t2,1000
	li	$s3,0			# $s3 -> 偏移量(?)
	add	$s3,$s3,$s1
Initial:slt	$t0,$t1,$t2		#循环初始化数组 全为0
	beq	$t0,$0,begin
	sw	$0,0($s3)
	addi	$s3,$s3,4
	addi	$t1,$t1,1
	j	Initial
	
begin:	move	$t3,$0
	addi	$t3,$t3,1		
	move	$t4,$0
	addi	$t4,$t4,-1		#素数标记为 $t3 = 1，其他标记为 $t4 = -1
	sw	$t4,0($s1)		# 1不是素数
	li	$t1,1
	move	$s0,$t1			# $s0 = i 当前数
	
	move	$s3,$s1			#$s3= $s1 数组首地址，将$s3作为偏移量
for_begin_1:				#找出1-1000里的所有素数，存入数组$s1
	slt	$t0,$s0,$t2
	beq	$t0,$0,xxxx		#找完以后跳转到xxxx
	
	lw	$s7,0($s3)		# $s7为取出的标记
	beq	$s7,$0,Judge		#取标记，若标记为0 则判断是否为一个素数
	
xxx:	
	addi	$s0,$s0,1		# 标记不为0 则 提取下一个标记
	addi	$s3,$s3,4
	
	j	for_begin_1

Judge:					#判断当前这个数$s0是不是素数
	addi	$t1,$t1,1		#$t1 = 2		
for:	slt	$t0,$t1,$s0
	beq	$t0,$0,for_y_2		#该数是个素数

	div	$s0,$t1
	mfhi	$t3
	beq	$t3,$0,for_n_2		#余数为0时，该数不是素数，跳出循环
	
	addi	$t1,$t1,1
	j	for

for_n_2:			#不是素数标记-1
	sw	$t4,0($s3)	
	j	xxx
for_y_2:			#是素数标记1
	sw	$t3,0($s3)
	j	Mark
Mark:	
	li	$s4,2		# $s4 = j ,素数的j倍为非素数
mloop:	mult	$s0,$s4
	mflo	$s5
	addi	$s5,$s5,-1
	slt	$t0,$s5,$t2
	beq	$t0,$0,xxx

	sll	$s5,$s5,2
	add	$s5,$s5,$s1
	addi	$s4,$s4,1
	lw	$s7,0($s5)		# $s7为取出的标记
	bne	$s7,$0,mloop		#取标记，若标记不为0 则取下一个倍数
	
	sw	$t4,0($s5)

	j mloop

xxxx:	li	$v0,5
	syscall
	move	$t6,$v0			#$t6 $t7 为范围
	
	li	$v0,5
	syscall
	move	$t7,$v0
	
	move	$s0,$t6
	
	la	$a0,head
	li	$v0,4
	syscall

	addi	$t7,$t7,1
xx:	
	slt	$t0,$s0,$t7		#$s0 = i
	beq	$t0,$0,Exit

	move	$a0,$s0
	move	$s3,$s0	
	addi	$s3,$s3,-1		
	sll	$s3,$s3,2
	add	$s3,$s1,$s3		#$s3 为偏移量
	lw	$s7,0($s3)
	addi	$s0,$s0,1
	bne	$s7,$t3,xx
	
	li	$v0,1
	syscall
	
	la   	$a0, space       # load address of spacer for syscall
        li   	$v0, 4           # specify Print String service
        syscall 
        addi	$s2,$s2,-1
	beqz	$s2,nn
	j	xx
	
Exit:	li	$v0,10
	syscall
	
nn:	la	$a0,n
	li	$v0,4
	syscall
	li	$s2,10
	j	xx
