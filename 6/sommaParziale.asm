.data

array: 12 1 3 -3 32 100 70 10000


#somma parziale:
#dato un array (di word, all'indirizzo $a0)
#un indice iniziale (a1)
#un indice finale (a2)
#restituisce (in v0) la somma di tutti gli elementi da a1 a a2 INCLUSI
.text
main:
	li $v0 5
	syscall
	move $s0 $v0
	li $v0 5
	syscall
	li $21 $v0
	
	la $s2 array
	move $a0 $s2
	move $a1 $s0
	move $a2 $s1
	jal sommaParziale
	
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
sommaParziale:
	li $v0 1
ciclo:	bgt $a1 $a2 fineCiclo #if ($a1>$a2) then break;
	mul $t0 $a1 4 	#t0 = i*4
	add $t0 $a0 $t0 #t0 = a0 + i*4, cioè la locazione di array[i]
	lw $t1 ($t0)
	add $v0 $v0 $t1
	addi $a1 $a1 1 #i++
	j ciclo
	
fineCiclo:
	jr $ra
