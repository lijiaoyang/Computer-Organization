ori $8,$8,1
ori $9,$9,0
ori $10,$10,2
ori $11,$11,4
lui $12,9
lui $13,6
addu $8,$8,$10
addu $8,$8,$12
subu $13,$13,$11
subu $13,$13,$9
sw $13,($11)
ori $13,$13,100
lw $9,($11)
jal label1
subu $9,$9,$13
beq $9,$0,label2
label1:ori $9,$9,100
addu $10,$9,$9
jr $31
label2:beq $9,$0,end
end:
