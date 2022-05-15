#Calcolare numeri di Fibonacci
#0,1,1,2,3,5,8,13,21,34,55
#f(0)=0
#f(1)=1
#f(n)=f(n-1)+f(n-2)	 per n>1
.globl main

.text
main:
	li $v0 5
	syscall
	
	move $a0 $v0
	jal fibo
	
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall 


fibo:	move $t0 $fp
	subi $fp $sp 4
	
	sw $t0 0($fp)
	sw $s0 -4($fp)
	sw $sp -8($fp)
	sw $ra -12($fp)
	sw $s1 -16($fp)
	
	add $sp $fp -16
	
	move $s0 $a0
	blt $s0 2 casoBase
	
	addi $a0 $s0 -1
	jal fibo
	move $s1 $s0	#s1 è fibo di s0-1
	
	addi $a0 $s0 -2
	jal fibo
	move $t2 $s0	#t2 è fibo di s0-2
	
	add $v0 $s1 $t2
	j fineFibo
	
	
		
				
	
	#passo1: mettiamo in $s0 il parametro (in $a0)
	#passo2: se $s0 è 0 oppure 1: caso base: fine funzione
	#passo3: altrimenti se $s0 > 1 
	#	$s1 = calcolare fibo(n-1)
	#	$s2 = calcolare fibo(n-2)
	#	sommare i due risultati nel risultato finale
casoBase:
	move $v0 $s0
	
fineFibo:
	lw $t0 0($fp)
	lw $s0 -4($fp)
	lw $sp -8($fp)
	lw $ra -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	jr $ra
	
