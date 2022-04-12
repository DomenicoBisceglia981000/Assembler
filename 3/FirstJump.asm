.globl main
.text
main:

li $t1 4
li $t2 6 #dopo questa istruzione voglio saltare alla riga 10
j jump #salto all'etichetta
add $t3 $t1 $t2 
jump:
li $v0 10 #uscita dal programma
syscall