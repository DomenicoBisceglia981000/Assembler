.data 
insert:
.asciiz "Inserisci un numero intero: "
.align 4
array: #qui metto il numero letto ed in fila il successivo
#.word 0 0
#oppure
#.space 8 --> qui lascio 8 byte di spazio(per metterci due numeri)
messaggio2: .ascii "ciao"
.text
la $s0 array #in t2 c'è l'indirizzo del primo elemento del vettore
la $a0 insert
li $v0 4
syscall # scrivi messaggio
li $v0 5
syscall #leggi numero
sw $v0 ($s0)
addi $t0 $v0 1
sw $t0 4($s0)
move $a0 $t0
li $v0 1
syscall
li $v0 10
syscall
#fine