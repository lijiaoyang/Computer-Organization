#n is row, m is column, a is the number of martixs to add
.data
matrix: .word 0:256
str1: .asciiz " "
str2: .asciiz"The result is:\n"
str3: .asciiz"\n"
.text
li     $v0, 5
syscall
move   $s0, $v0          #put row(n) in $s0
li     $v0, 5
syscall
move   $s1, $v0          #put column(m) in $s1
li     $v0, 5
syscall
move   $s2, $v0          #put the number of adding matrixs (a) in $s2
add    $s3, $s0, $s1

li     $t0, 0             # $t0 is current row
li     $t1, 0             # $t1 is current column
li     $t3, 0             # $t2 is current sum 

get:
li     $v0, 5
syscall

mult   $s1,$t0
mflo   $t2                 #$t2 is current row * column
add    $t2, $t2, $t1
sll    $t2, $t2, 2
sw     $v0, matrix($t2)    #put num in the martix
addi   $t1, $t1, 1         #current column++
bne    $t1, $s1, get      #not at the end of column
move   $t1, $zero          #reset $t1
addi   $t0, $t0, 1         #current row ++
bne    $t0, $s0, get      

move   $t0, $zero         #reset $t0
move   $t1, $zero         #reset $t1
addi   $t3, $t3, 1
beq    $t3, $s2, first
adder:
li     $v0, 5
syscall

mult   $s1,$t0
mflo   $t2                 #$t2 is current row * column
add    $t2, $t2, $t1
sll    $t2, $t2, 2
lw     $t4, matrix($t2)    #load word then put nin $t4
add    $t4, $t4, $v0
sw     $t4, matrix($t2)    #save result in matrix
addi   $t1, $t1, 1         #current column++
bne    $t1, $s1, adder      #not at the end of column
move   $t1, $zero          #reset $t1
addi   $t0, $t0, 1         #current row ++
bne    $t0, $s0, adder 
move   $t0, $zero         #reset $t0
move   $t1, $zero         #reset $t1
addi   $t3, $t3, 1         #sum ++
bne    $t3, $s2, adder    #not add all so countinue add

move   $t0, $zero         #reset $t0
move   $t1, $zero         #reset $t1



first:
la     $a0, str2
li     $v0, 4
syscall

out:

mult   $s1,$t0
mflo   $t2                 #$t2 is current row * column
add    $t2, $t2, $t1
sll    $t2, $t2, 2
lw     $a0, matrix($t2)    #load num in $a0
li     $v0, 1
syscall
add    $t7, $t5, $t6
beq    $t7, $s3, end
la     $a0, str1
li     $v0, 4
syscall
addi   $t1, $t1, 1         #current column++
addi   $t5, $t1, 1
bne    $t1, $s1, out      #not at the end of column

la     $a0, str3
li     $v0, 4
syscall

move   $t1, $zero          #reset $t1
addi   $t0, $t0, 1         #current row ++
addi   $t6, $t0, 1
bne    $t0, $s0, out    

move   $t0, $zero         #reset $t0
move   $t1, $zero         #reset $t1

end:
nop
