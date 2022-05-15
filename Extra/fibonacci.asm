# Esercizio: scrivere una funzione ricorsiva fibonacci
# che, dato un numero i, restisca l'i-esimo numero di Fibonacci
# (v. lucidi)
# i            :  0  1  2  3  4  5  6  7 ...
# Fibonacci(i) :  1  1  2  3  5  8 13 21 ... 

.globl main
.text

fibonacci:
  move $t0 $fp
  addi $fp $sp -4
  sw $t0 0($fp)
  sw $ra -4($fp)
  sw $sp -8($fp)
  sw $s0 -12($fp)
  sw $s1 -16($fp)
  sw $s2 -20($fp)
  addi $sp $fp -20
  # CORPO DELLA FUNZIONE
  # $s0 = fibonacci( $a0 - 1 )
  ble $a0 1 casoBase
  addi $s2 $a0 -1 
  move $a0 $s2
  jal fibonacci
  move $s0 $v0
  # $s1 = fibonacci( $a0 - 2 )
  addi $s2 $s2 -1 
  move $a0 $s2
  jal fibonacci
  move $s1 $v0
  # $v0 = $s0 + $s1
  add $v0 $s0 $s1
  # FINE DEL CORPO
epilogo:
  lw $t0 0($fp)
  lw $ra -4($fp)
  lw $sp -8($fp)
  lw $s0 -12($fp)
  lw $s1 -16($fp)
  lw $s2 -20($fp)
  move $fp $t0
  jr $ra
casoBase:
  # return 1
  li $v0 1
  j epilogo
  
  

main:
  # 0 1 2 3 4 5  6  7  8  9 
  # 1 1 2 3 5 8 13 21 34 55 
  # $s0 := fibonacci( 8 )
  li $a0 100
  jal fibonacci
  move $s0 $v0
  
  # print( $s0 )
  move $a0 $s0
  li $v0 1
  syscall
  
  # exit()
  li $v0 10
  syscall
  

