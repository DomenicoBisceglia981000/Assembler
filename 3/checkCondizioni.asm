#scrivere un programma che prenda in input 3 interi inseriti dall'utente 
#if a >= b and c!=0 then z=c(a+b), print z
#else print errore
.globl main
.data
print:
.asciiz "Inserisci un intero:"
errorText:
.asciiz "ERRORE"
.text
main:
	la $a0 print
	li $v0 4
	syscall 
	li $v0 5
	syscall#lettura intero a
	move $s0 $v0
	li $v0 4
	syscall 
	li $v0 5
	syscall #lettura intero b
	move $s1 $v0
	li $v0 4
	syscall 
	li $v0 5
	syscall #lettura intero c
	move $s2 $v0
	bge $s0 $s1 primaCondizioneVerificata
	j errore
primaCondizioneVerificata:
	bnez $s2 secondaCondizioneVerificata
	j errore
secondaCondizioneVerificata:
	add $t0 $s0 $s1
	mult $s2 $t0
	mflo $a0
	li $v0 1
	syscall
	j end 
errore:
	la $a0 errorText
	li $v0 4
	syscall
	j end
end:
li $v0 10
syscall