#nome del file sorgente: sommaSelettiva.asm
#Si scriva un programma che:
#• chieda all’utente di inserire un array di interi di dimensione arbitraria (si
#scelga una dimensione massima da non eccedere).
#• invochi una procedura P
#• stampi il valore ritornato da P
#La procedura P è definita come segue:
#• Input: l’array inserito dall’utente e un parametro k
#• se k=0 la procedura calcola la somma di tutti gli interi in posizione (indice
#nell’array) dispari
#• se k=1 sommerà quelli in posizioni pari.
#Suggerimento: allocare l’array staticamente in memoria e passare alla procedura
#il base address (passaggio per indirizzo).
.data
inserisciNumero: .asciiz"\nInserisci numero : "
inserisciK: .asciiz "\nInserisci un k : "
stampaSomma: .asciiz "\nLa somma dei numeri del vettore nella posizione chiesta è : "
.align 4
array: 
.globl main
.text
main:	la $a1 array
	li $t0 1
loop: 	bgt $t0 7 fineLoop
	la $a0 inserisciNumero
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 ($a1)
	addi $a1 $a1 4
	addi $t0 $t0 1
	j loop	
fineLoop:
	la $a0 inserisciK
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $v0 $a0
	la $a1 array
	jal P
end:	li $v0 10
	syscall
#La procedura P è definita come segue:
#• Input: l’array inserito dall’utente e un parametro k
#• se k=0 la procedura calcola la somma di tutti gli interi in posizione (indice
#nell’array) dispari
#• se k=1 sommerà quelli in posizioni pari.
P:	move $a0 $t0 #operazione
	move $a1 $t1 #rif array
	li $t2 1 #contatore
	beqz $a0 ugZero
	li $t2 2 #contatore
	beq $a0 1 ugUno
ugZero:	#somma di tutti gli interi in posizione dispari
	bgt $t2 7 fineCicloP
	lw $t4 ($t1)
	addi $t1 $t1 8
	add $t3 $t3 $t4

	addi $t2 $t2 2
ugUno:	#somma di tutti gli interi in posizione pari	
	bgt $t2 7 fineCicloP
	lw $t4 ($t1)
	addi $t1 $t1 8
	add $t3 $t3 $t4
	addi $t2 $t2 2
fineCicloP:
	la $a0 stampaSomma
	li $v0 4
	syscall
	move $t3 $a0
	li $v0 5	
	jr $ra