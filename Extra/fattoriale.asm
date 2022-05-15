# esercizio: scrivere una funzione ricorsiva che dato un intero n
# restituice il fattoriale di n (n!)


.globl main
# input: a0
# output: a0! (dove 10! = 10*9*8*7*...*1)

# fattoriale(x: int) {
#   if (x<=0) return 1
#   return x * fattoriale(x-1)
# }

fattoriale:
  move $t0 $fp
  add $fp $sp -4
  sw $t0   ($fp)
  sw $sp -4($fp)
  sw $ra -8($fp)
  sw $s0 -12($fp)
  sw $s1 -16($fp)
  addi $sp $fp -16

  move $s0 $a0  # s0 = x
  
  # if (x<=0) return 1
  li $v0 1
  blez $s0 fine
  
  # $s1 = fattoriale(x-1)
  addi $a0 $s0 -1
  jal fattoriale
  move $s1 $v0
  
  mul $v0 $s0 $s1
  # $v0 = x * $s1
  
  fine:
  lw $t0   ($fp)
  lw $sp -4($fp)
  lw $ra -8($fp)
  lw $s0 -12($fp)
  lw $s1 -16($fp)
  move $fp $t0
  jr $ra
  
 
 
main:
   li $a0 4
   jal fattoriale
   move $a0 $v0
   
   li $v0 1
   syscall
  
  
  