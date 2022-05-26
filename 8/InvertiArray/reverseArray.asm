.globl reverseArray

.text
# reverseArray
# a0 : indirizzo di (primo elemento dell') array A (da invertire)
# a1 : indirizzo di (primo elemento dell') array B (già allocato da qualche parte)
# a2 : numero di elementi di entrambi gli array 
reverseArray:
	#t1 = a1 + (a2 - 1) * 4, cioè la posizione dell'ultimo elemento di B
	subi $t1 $a2 1 #t1 = a2 - 1
	sll $t1 $t1 2 	# t1 = (a2-1)*4
	add $t1 $t1 $a1	# t1 = a1+(a2-1)*4
	
ciclo:	blt $t1 $a1 fineCiclo
	
	lw $t0 ($a0)
	sw $t0 ($t1)
	
	addi $a0 $a0 4
	subi $t1 $t1 4
	
	j ciclo
	
fineCiclo:
	jr $ra