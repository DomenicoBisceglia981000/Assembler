.globl main
.text
main:

li $t1 4
li $t2 6 
la $at jump #registro di utilizzo esclusivo
jr $at 
add $t3 $t1 $t2 
jump:
li $v0 10 #uscita dal programma
syscall