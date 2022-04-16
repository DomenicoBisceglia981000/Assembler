#Si scriva il codice assembly che:
#• inizializzi il segmento dati con un array di 13 interi scelti a piacere;
#• chieda all’utente di inserire tre interi a, b e c;
#• se c=0, scambi l’a-esimo elemento dell’array con il b-esimo;
#• se c=1, sovrascriva il b-esimo elemento dell’array con il valore dell’a-esimo
#elemento;
#• se c=-1, sovrascriva l’a-esimo elemento dell’array con il valore del b-esimo
#elemento;
#• se c ha un altro valore stampi la stringa «comando non riconosciuto» e
#non effettui modifiche all’array.
.globl main
.data
inserisciA:
.asciiz "Inserisci il numero intero a : "
inserisciB:
.asciiz "Inserisci il numero intero b : "
inserisciC:
.asciiz "Inserisci il numero intero c : "
array: .word 1 2 3 4 5 6 7 8 9 10 11 12 13
.text
la $a0 inserisciA
li $v0 4
syscall 
li $v0 5
syscall #lettura a
move $s0 $v0

la $a0 inserisciB
li $v0 4
syscall 
li $v0 5
syscall #lettura b
move $s1 $v0

la $a0 inserisciC
li $v0 4
syscall 
li $v0 5
syscall #lettura c
move $s2 $v0
la $s3 array
beqz $s2 cUZero
li $s7 4

cUZero:
#• se c=0, scambi l’a-esimo elemento dell’array con il b-esimo;
mult $s2 $s7
mflo $t0
lw $t0 $t0($s3)


cUUno:
#• se c=1, sovrascriva il b-esimo elemento dell’array con il valore dell’a-esimo
#elemento;

cUMUno:
#• se c=-1, sovrascriva l’a-esimo elemento dell’array con il valore del b-esimo
#elemento;

cDiverso:
#• se c ha un altro valore stampi la stringa «comando non riconosciuto» e
#non effettui modifiche all’array.
