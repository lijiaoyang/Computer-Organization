.data
str:.space 800
string:.asciiz"String is:"
enter:.asciiz"\n"
.text
li $v0,5  #s1==n
syscall
move $s1,$v0
li $t0,0# i
li $s0,32 #s0 is small->large
li $t1,97 #a

while:
	beq $t0,$s1,end
	li $v0,12
	syscall
	move $s2,$v0
	sub $s3,$s2,$t1
	bgez $s3,change_large
	bltz $s3,store
	change_large:	sub $s4,$s2,$s0
			move $s2,$s4
			j store
	store:
     		
     		la $t2,str #ȡ���������ַ
      		li $t3,4      #t3��Ϊ4
      		mult $t3,$s5  #t3��ѭ��������Ԫ����ţ����
      		mflo $t3      #�����ȡ��t3
      		addu $t2,$t2,$t3  #��t3����t2������t2��
      		sw $s2,0($t2)
      		addi $s5,$s5,1
		addi $t0,$t0,1
	j while	
end:
		la $a0,string
		li $v0,4
		syscall
li $s5,0
for1:
		sub $s6,$s1,$s5
		beq $s6,$zero,end1
     		la $t2,str #ȡ���������ַ
      		li $t3,4      #t3��Ϊ4
      		mult $t3,$s5  #t3��ѭ��������Ԫ����ţ����
      		mflo $t3      #�����ȡ��t3
      		addu $t2,$t2,$t3  #��t3����t2������t2��
      		lw $t7,0($t2)
      		li $v0,11
      		move $a0,$t7
      		syscall
		addi $s5,$s5,1
		addi $t2,$t2,1
		j for1
      		end1:
	
