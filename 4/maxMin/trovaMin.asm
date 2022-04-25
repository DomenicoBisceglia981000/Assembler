#devo dichiarare che questo file trovaMin sia globale
.globl trovaMin
.text
trovaMin:		
	# t0=BIGNUMBER
	# for i=0; i<n; i++
	# 	 if t0>array[i] then t0=array[i]
	# }
	# t0 è il minimo elemento (o rimane BIGNUMBER se l'array è vuoto)
	li $t0 0xFFFFFFF #t0 è il massimo attuale
	li $t1 0 #i: t1 = 0
ciclo:	bge $t1 $a0 fineCiclo #if t1 >= a0 
	sll $t2 $t1 2	#t2 = i*4
	add $t2 $t2 $a1 #ora t2 è l'indirizzo di array[i]
	lw $t3 ($t2)	#t2 è il VALORE di array[i]
	ble $t0 $t3 continue	#if t0 >= t3 then continue
	move $t0 $t3
continue:	
	addi $t1 $t1 1
	j ciclo
fineCiclo:  
	move $v0 $t0
	jr $ra