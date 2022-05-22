.data
mioVett: 3 4 1 2 3 0 
msgRaddoppio: .asciiz "RADDOPPIO CAPIENZA!"
.globl main
.text
main:
	la $s0 mioVett
	move $a0 $s0
	jal printAll	# printAll(mioVett)
	
	move $a0 $s0
	li $a1 666
	jal pushBack	# mioVett = pushBack(mioVett, 666)
	move $s0 $v0
	
	move $a0 $s0
	li $a1 555
	jal pushBack	# mioVett = pushBack(mioVett, 666)
	move $s0 $v0
	
	move $a0 $s0
	jal printAll	# printAll(mioVett)
			
	li $v0 10
	syscall
	

#funzione pushBack: aggiunge in coda un elemento al vettore dinamico (in a0)	
#input: $a0 = vettore su cui lavorare 
#	$a1 = elemento da aggiungere
#output: $v0 = nuova posizione del vettore (potrebbe non essere $a0)
pushBack:
	#preambolo
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	sw $s2 -20($fp)
	sw $s3 -24($fp)
	sw $s4 -28($fp)
	sw $s5 -32($fp)
	sw $s6 -36($fp)
	sw $s6 -40($fp)
	addi $sp $fp -40 
	

	move $s0 $a0	# s0 = a0 (il vettore su cui fare la pushback)
	move $s5 $a1	# s5 = a1 (il numero da inserire)
	lw $s1 0($a0)	# s1 = len(-gth) = a0[0]
	lw $s4 4($a0)	# s4 = cap(-ienza) = a0[4]
	blt $s1 $s4 capienzaSufficiente	#if len < cap then goto capienzaSufficiente
	#len = a0[0]
	#cap = a0[1]
	
capienzaInsufficiente:	#Siccome la capienza è insufficiente, rialloco il vettore, lo copio
			#prima di porcedere a fare la pushBack come normale 
	#ALLOCARE NUOVO VETTORE 
	# capienza = capienza * 2;  raddoppio la capienza	//ALLOCARE NUOVO VETTORE NELLO HEAP!!!
	# s6 = malloc(capienza*4 + 4 + 4) 
	#for (i=0; i< lenght; i++) s6[i+2] = s0[i+2]
	#s6[0] = len
	#s6[1] = capienza	
	# free(s0) //potrei distruggere la vecchia copia del vettore, ma con mars non possiamo farlo. - MEMORY LEAK
	
	la $a0 msgRaddoppio
	li $v0 4
	syscall
	
	sll $s4 $s4 1 	# capienza = capienza * 2;  raddoppio la capienza	//ALLOCARE NUOVO VETTORE NELLO HEAP!!!
	
	# s6 = malloc(capienza*4 + 4 + 4) 
	sll $a0 $s4 2 	#a0 = capienza * 4
	addi $a0 $a0 8
	li $v0 9
	syscall
	move $s6 $v0
	
	sw $s1 0($s6)#s6[0] = len
	sw $s4 4($s6)#s6[1] = capienza	
	
	#for (i=0; i< lenght; i++) s6[i+2] = s0[i+2]
	li $s7 0	# a7 = 0 || i = 0
ciclo2:	bgt $s7 $s1 fineCiclo2
	
	sll $t0 $s7 2	# t0 = i * 4
	add $t1 $t0 $s0	# t0 = s0 + i*4, cioè la locazione di s0[i]
	lw $t1 8($t1)	# t0 = s0[i+2]
	
	add $t2 $t0 $s6	# t2 = s1 + i*4, cioè la locazione di s6[1]
	sw $t1 8($t2)	# s6[i+2] = s0[i+2]	store in memoria, nello heap
	
	addi $s7 $s7 1	#s7++ || i++
	j ciclo2
fineCiclo2:
	move $s0 $s6
	
	
capienzaSufficiente:
	# i = a0[0]
	# a0[0] = i + 1
	# a0[i+2] = a1
	# return a0
	addi $s2 $s1 1	# s2 = len + 1
	sw $s2 ($s0)	# a0[0] = s2
	sll $s3 $s1 2	# s3 = len*4
	add $s3 $s3 $s0	# s3 = len*4 + a0, cioè l'indirizzo di a0[len]
	sw $s5 8($s3)	# scrivo a1 in a0[len+2]
	move $v0 $s0	# return s0
	
	#EPILOGO
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	lw $s2 -20($fp)
	lw $s3 -24($fp)
	lw $s4 -28($fp)
	lw $s5 -32($fp)
	lw $s6 -36($fp)
	lw $s7 -40($fp)
	move $fp $t0
	jr $ra		
#funzione printAll: disegna tutti gli elementi di un vettore dinamico dato
#parametri: a0: indirizzo del vettore dinamico
printAll: 
	# int len = a[0];
	# int last = len+2
	# for (i=0; i < last; i++) print(a[i])
	
	#preambolo
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	sw $s2 -20($fp)
	addi $sp $fp -20 
	
	move $s2 $a0	#salvo a0 in s2
	lw $s0 ($a0) 	# s0 = len
	addi $s0 $s0 2 	# s0 = last
	li $s1 2 	# s1 = i = 2

	li $v0 11	#\
	li $a0 91	# > print ('[')
	syscall		#/

ciclo:	bge $s1 $s0 fineCiclo
	sll $t1 $s1 2 	# t1 = i * 4
	add $t1 $t1 $s2	# t1 = i * 4 + a0, cioè l'indirizzo di a[i]
	lw $t1 ($t1)	# t1 = a[i]
	
	li $v0 1	#\
	move $a0 $t1	# > print (t1)
	syscall		#/
	
	li $v0 11	#\
	li $a0 44	# > print (',')
	syscall		#/
	addi $s1 $s1 1	# i++
	j ciclo
fineCiclo:
	li $v0 11	#\
	li $a0 93	# > print (',')
	syscall		#/
	
	#EPILOGO
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	lw $s2 -20($fp)
	move $fp $t0
	jr $ra
