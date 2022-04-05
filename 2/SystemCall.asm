#un programma può fare chiamate al sistema

#scrivere codice assembly che:
#chieda all'utente di inserire un intero
#acquisista un intero da terminale
#calcoli l'intero successivo
#mostri l'intero successivo
.data 
insert:
.asciiz "Inserisci un numero intero: "
.text
li $v0 4
la $a0 insert
syscall

li $v0 5
syscall

addi $a0, $v0 1 
li $v0 1
syscall

li $v0 10
syscall
#fine