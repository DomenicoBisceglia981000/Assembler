.data
errText: .asciiz "Il codice operativo inserito non è valido!"
.align 4
.globl elaboratore
.text 
elaboratore:
	move $a0 $t0 
	move $a1 $t1  
	move $a2 $t2 
	beq $t2 1 addizione
	beq $t2 2 divisione
	beq $t2 3 moltiplicazione
	beq $t2 4 divisione
errore:
	la $a0 errText
	li $v0 4
	syscall
	j return
addizione:
	add $v0 $t0 $t1
	j return	
sottrazione:
	sub $v0 $t0 $t1
	j return
moltiplicazione:
	mult $t0 $t1
	mflo $v0
	mfhi $v1
	j return
divisione:
	div $t0 $t1
	mflo $v0
	mfhi $v1
return:	
	jr $ra