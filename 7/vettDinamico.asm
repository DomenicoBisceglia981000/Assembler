.data
mioVett: 3 8 1 2 3 0 0 0 0 0
.globl main
.text
main:
	la $a0 mioVett
	jal printAll	#mioVett.printAll() || printAll(mioVett)
	
	la $a0 mioVett
	la $a1 666
	jal pushBack
	
	la $a0 mioVett
	la $a1 555
	jal pushBack

	la $a0 mioVett
	jal printAll
			
	li $v0 10
	syscall
	

	
	
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
	addi $sp $fp -32 
	

	move $s0 $a0	# s0 = a0 (il vettore su cui fare la pushback)
	move $s5 $a1	# s5 = a1 (il numero da inserire)
	lw $s1 0($a0)	# s1 = len(-gth) = a0[0]
	lw $s4 4($a0)	# s4 = cap(-ienza) = a0[4]
	blt $s1 $s4 capienzaSufficiente
	#len = a0[0]
	#cap = a0[1]
	#if len < cap then goto capienzaSufficiente
#capienzaInsufficiente: 
	#ALLOCARE NUOVO VETTORE 
	
capienzaSufficiente:
	# i = a0[0]
	# a0[0] = i + 1
	# a0[i+2] = a1
	addi $s2 $s1 1	# s2 = len + 1
	sw $s2 ($s0)	# a0[0] = s2
	sll $s3 $s1 2	# s3 = len*4
	add $s3 $s3 $s0	# s3 = len*4 + a0, cioè l'indirizzo di a0[len]
	sw $s5 8($s3)	# scrivo a1 in a0[len+2]
	
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
