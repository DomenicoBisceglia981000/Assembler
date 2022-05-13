.data

.globl maiuscolizzaStringa
.text
#funzione maiuscolizzaStringa:
#PARAMETRI: 
#- a0 indirizzo della stringa (terminata da 0) da volgere in maiuscolo
#OUTPUT:
#- nessuno	(funzione in-place)

maiuscolizzaStringa:
	addiu $fp $sp -4 #meno 4 perchè dobbiamo scendere nello stack. Prendiamo il frame pointer e lo piazzamo sopra lo stack pointer
	
	#SALVO TUTTI I REGISTRI CHE VOGLIO SALVARE IN RAM
	sw $s0 0($sp)	#salvo tutti i registri nello stack pointer.
	sw $s1 -4($sp)
	sw $s2 -8($sp)
	sw $ra -12($sp)	#salvo anche il return address
	sw $s3 -16($sp)
	sw $s7 -20($sp)
	sw $fp -28($fp)
	
	addi $sp $fp -28 	#la prossima funzione così sa da dove deve iniziare
	
	move $s0 $a0
ciclo:	lb $s1 ($s0) #comando che prende un singolo byte della stringa, la lb non è allineata a 4, la prossima lettera sarà a distanza 1.
	beqz $a0 fineCiclo	#se il valore è 00, esci dal ciclo
	
	move $a0 $t1 
	jal maiuscolizzaLettera	#OCCHIO! qui scriviamo su $ra
	move $t2 $v0
	
	sb $v0 ($t0)
	addiu $t0 $t0 1
	j ciclo
fineCiclo:
	lw $s0 0($sp)	#salvo tutti i registri nello stack pointer.
	lw $s1 -4($sp)
	lw $s2 -8($sp)
	lw $ra -12($sp)	#salvo anche il return address
	lw $s3 -16($sp)
	lw $s7 -20($sp)
	lw $sp -24($fp)	#flush! dello stack
	sw $t0 -28($fp)
	
	move $fp $t0
	jr $ra	#ritorno al chiamante
	
