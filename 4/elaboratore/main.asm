#nome del file sorgente: elaboratore.asm
#Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma,
#differenza, moltiplicazione e divisione tra due numeri interi.
#Input: i due operandi e un terzo parametro per la selezione dell’operazione.
#Output: risultato (nel caso della divisione restituisce anche il resto).
#Si scriva poi il main dove:
#• vengono chiesti all’utente operandi e operatore;
#• il risultato dell’operazione è mostrato a terminale.

.data
testoIniziale: .asciiz "Inserisci i due operandi e scegli l'operazione tra: \n1 - Somma\n2 - Sottrazione\n3 - Moltiplicazione\n4 - Divisione |con resto|"
inserisciNumeroA: .asciiz "\nInserisci operando a : "
inserisciNumeroB: .asciiz "\nInserisci operando b : "
inserisciOperazione: .asciiz "\nInserisci operazione da eseguire : "
stampaRisultato: .asciiz "\nIl risultato dell'operazione è : "
stampaQuoziente: .asciiz "\nQuoziente : "
stampaResto: .asciiz " | Resto : "
.align 4
.globl main
.text
main:
	la $a0 testoIniziale
	li $v0 4
	syscall
	
	la $a0 inserisciNumeroA
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $s0 $v0 
	la $a0 inserisciNumeroB
	li $v0 4
	syscall
	li $v0 5
	syscall
	move  $s1 $v0
	la $a0 inserisciOperazione
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $v0 $s2  
	#ho preso tutti gli input dall'utente
	#preparo i dati da "mandare" alla funzione : 
	move $s0 $a0
	move $s1 $a1
	move $s2 $a2
	jal elaboratore
	move $v0 $s0  
	move $v1 $s1  
	bne $s0 4 notDiv
	la $a0 stampaQuoziente
	li $v0 4
	syscall
	move $a0 $s0 
	li $v0 1
	syscall 
	la $a0 stampaResto
	li $v0 4
	syscall
	move $a0 $s1 
	li $v0 1
	syscall
notDiv:
	la $a0 stampaRisultato
	li $v0 4
	syscall
	
	move $s1 $a0
	li $v0 1
	syscall
	move  $s0 $a0 
	li $v0 1
	syscall
	
end:
	li $v0 10
	syscall
	