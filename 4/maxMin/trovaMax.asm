.globl trovaMax
.text
trovaMax:
	li $t0 -1
	li $t1 0
ciclo:	bge $t1 $a0 fineCiclo
	sll $t2 $t1 2	
	add $t2 $t2 $a1 
	lw $t3 ($t2)
	bge $t0 $t3 continue	#if t0 >= t3 then continue
	move $t0 $t3
continue:	
	addi $t1 $t1 1
	j ciclo
fineCiclo:
	move $v0 $t0
	jr $ra
	
	