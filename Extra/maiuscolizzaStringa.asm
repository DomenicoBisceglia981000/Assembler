# esercizio:
# 
# 1 - scrivere una funzione maiuscolizzaLettera
#     che dato un carattere (espresso in codice ASCII)
#     restituisce la sua versione maiuscola, se quel 
#     carattere è una lettera minuscola, e il carattere
#     stesso in ogni altro caso (spazi, virgole, etc)
#
# 2 - scrivere una funzione maiuscolizzaStringa
#     che, dato l'indirizzo di una stringa (terminata da 0)
#     volge in maiuscolo le sue lettere minuscole,
#     usando la funzione maiuscolizzaLettera


.globl main
.data
mess:
.asciiz "Arch1tettura 2"
.text

maiuscolizzaStringa:
move $t0 $fp
addi $fp $sp -4
sw $t0 ($fp)
sw $ra -4($fp)
sw $sp -8($fp)
sw $s0 -12($fp)
addi $sp $fp -12

#for i:=0; st[i]!=0; i++{
# st[i]=maiuscolizzaLettera(st[i])
# }
 move $s0 $a0
 ciclo:
 lb $t0 ($s0)
 beqz $t0 fineCiclo
 move $a0 $t0
 jal maiuscolizzaLettera
 sb $v0 ($s0)
 addi $s0 $s0 1
 j ciclo
 fineCiclo:
 lw $t0 ($fp)
 lw $ra -4($fp)
 lw $sp -8($fp)
 lw $s0 -12($fp)
 move $fp $t0
 jr $ra
 
#input: $a0=carattere ascii alfanumerico
# output: $v0 versione maiuscola (se è char)
#a-z: 97-122  A-Z: 65-90
maiuscolizzaLettera:
 move $v0 $a0
 blt $a0 97 fine
 bgt $a0 122 fine
 subi $v0 $a0 32
 fine:
 jr $ra

main:
la $a0 mess
jal maiuscolizzaStringa
la $a0 mess
li $v0 4
syscall

li $v0 10
syscall
  