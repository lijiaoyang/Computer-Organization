.data
	pri:.word
	2 3 5 7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97 101 103 107 109 113
	127 131 137 139 149 151 157 163 167 173
	179 181 191 193 197 199 211 223 227 229
	233 239 241 251 257 263 269 271 277 281
	283 293 307 311 313 317 331 337 347 349
	353 359 367 373 379 383 389 397 401 409
	419 421 431 433 439 443 449 457 461 463
	467 479 487 491 499 503 509 521 523 541
	547 557 563 569 571 577 587 593 599 601
	607 613 617 619 631 641 643 647 653 659
	661 673 677 683 691 701 709 719 727 733
	739 743 751 757 761 769 773 787 797 809
	811 821 823 827 829 839 853 857 859 863
	877 881 883 887 907 911 919 929 937 941
	947 953 967 971 977 983 991 997
	string: .asciiz "The prime numbers are:"
	space: .asciiz " "
	enter: .asciiz"\n"	
.text
	li $v0,5  #读入m，把n输入 $s0 ,$s0==m
	syscall
	move $s0,$v0
	li $v0,5  #s1==n
	syscall
	move $s1,$v0
	li $t3,1
	sub $t2,$s0,$t3	
	sub $t4,$s1,$t3
	or $t5,$t2,$t4
	beq $t5,$zero,printend
	li $t3,0
	li $t2,0
	li $t5,0
	li $t4,0
	add $s2,$s0,$zero  #s2=i=m
	li $t1,0
	li $s5,1
	for:
		
      		la $t2,pri #取出数组基地址
      		li $t3,4      #t3设为4
      		mult $t3,$t1  #t3与循环变量（元素序号）相乘
      		mflo $t3      #将结果取回t3
      		addu $t2,$t2,$t3  #将t3加上t2并存在t2中
      		lw $t4,0($t2)	
      		sub $t5,$s2,$t4  #m-t4<=0
      		beq $s3,$s5,findn
      		blez $t5,end1
      		addi $t1,$t1,1
      		j for
      	findn:	sub $t6,$s1,$t4  #n-t4>=0
      		bltz $t6,end2
      		addi $t1,$t1,1
      		addi $s2,$s2,1
      		j for		
	end1:	
		move $s6,$t4  		#s6  is first
		move $s4,$t1 		#first address is $s4
		addi $t1,$t1,1
		li $s3,1
		addi $s2,$s2,1
		j for
	end2:
      		addi $t1,$t1,-1  		#last address is t1
      		la $t2,pri #取出数组基地址
      		li $t3,4      #t3设为4
      		mult $t3,$t1  #t3与循环变量（元素序号）相乘
      		mflo $t3      #将结果取回t3
      		addu $t2,$t2,$t3  #将t3加上t2并存在t2中
      		lw $t4,0($t2)	
		move $s7,$t4		#s7 is end
	li $s0,0  #j
	beq $s0,$zero,print
	print:
		la $a0,string
		li $v0,4
		syscall
	li $s1,10
	li $t5,0
	add $t5,$zero,$s4    #s5 is first address 
for3:	
	div $s0,$s1
	mfhi $s2
	bne $s0,$zero,enter1
	enter1:
		beq $s2,$zero,enter2
		j printprime
	enter2:
		la $a0,enter
		li $v0,4
		syscall
	printprime:	
	sub $t0,$t5,$t1
	bgtz $t0,end3
	la $t2,pri #取出数组基地址
      	li $t3,4      #t3设为4
      	mult $t3,$t5  #t3与循环变量（元素序号）相乘
      	mflo $t3      #将结果取回t3
      	addu $t2,$t2,$t3  #将t3加上t2并存在t2中
      	lw $t6,0($t2)
      	j printpri
      	printpri:
      		li $v0,1
      		move $a0,$t6
      		syscall
		la $a0,space
		li $v0,4
		syscall
      		addi $t5,$t5,1
	addi $s0,$s0,1
	j for3
	printend:
		la $a0,string
		li $v0,4
		syscall	
		la $a0,enter
		li $v0,4
		syscall	
	end3:

	
