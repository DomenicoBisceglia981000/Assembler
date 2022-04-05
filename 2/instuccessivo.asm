.data
stampa:
.asciiz "Inserisci un numero: "
.text
la $a0 stampa
li $v0 4
syscall #stampa richiesta numero
li $v0 5
syscall #lettura intero
addi $a0 $v0 1
li $v0 1
syscall #stampa numero + 1
li $v0 10
syscall #chiusura esecuzione