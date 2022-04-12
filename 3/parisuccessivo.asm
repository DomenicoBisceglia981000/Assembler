#si scriva un programma che preso in input un intero dall'utente restituisca il numero pari successivo
.globl main
.data
primaStampa:
.asciiz "Inserisci un numero intero : "
.text
main:
	la $a0 primaStampa
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	move $s0 $v0
	
end:
li $v0 10
syscall