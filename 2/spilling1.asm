#usando solo i registri $s0 e $t0:
# - Calcolare la somma dei primi tre numeri interi positivi (1, 2, 3), ciascuno moltiplicato per 3
# - non si utilizzi la pseudo-istruzione mul
.data
x: .word 1
y: .word 2
z: .word 3
stampa: .asciiz "I numeri risultanti sono: "
.text
la $t0 x
lw $s0 0($t0)
li $t0 3
mult $s0 $t0 
mflo $s0
addi $sp $sp -4
sw $s0 0($sp)

la $t0 y
lw $s0 0($t0)
li $t0 3
mult $s0 $t0 
mflo $s0
addi $sp $sp -4
sw $s0 0($sp)

la $t0 z
lw $s0 0($t0)
li $t0 3
mult $s0 $t0 
mflo $s0
addi $sp $sp -4
sw $s0 0($sp)

la $a0 stampa
li $v0 4
syscall

lw $a0 0($sp)
addi $sp $sp 4
li $v0 1
syscall
lw $a0 0($sp)
addi $sp $sp 4
syscall
lw $a0 0($sp)
addi $sp $sp 4
syscall

li $v0 10
syscall




