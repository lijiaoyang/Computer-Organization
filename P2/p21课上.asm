#���˾����Լ���p2���˸��Ӱ��� һ������Ϊ���ĵİ�ҹ���ϻ���ʱ�������ַ����˷��˴���ʱ��Ҳû��������
#����ʵ����һ�飬��������Ҳû���ˣ��͸���ҵ������Ͽ�һ�£�
#��Ŀ����Ǿ���ת�ú���ӣ����������˼·һ���Ǿ�����Ӻ�ת�ã�
#�ڶ����Ǿ�����ת������ӣ��˳����Եڶ���ʵ�֣��������ײ�õ�һ�ַ�ʽ���׵Ķࣩ
#��Ŀ�������������Ҫ�󣬴˳���û��ʵ�֡�
.data 
	array:.word 0:400
	s0:.asciiz "The result is:\n"
	space:.asciiz " "
	newline:.asciiz "\n"
.text 
#��Ϊ���õڶ��ַ�ʽ����ԭ������е���ת�ú���У�ԭ������е���ת�ú����
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
	bne $t0, $s1, getmatrix#һ��δ����ǰ��ת��������һ�к��������ִ��
	move $t0,$0
	addi $t1,$t1,1
	bne $t1, $s0,getmatrix#ȫ������������ִ��
	
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
	bne $t0, $s1, addmatrix#һ��δ����ǰ��ת��������һ�к��������ִ��
	move $t0,$0
	addi $t1,$t1,1
	bne $t1, $s0,addmatrix#ȫ������������ִ��
	
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
