.data
mioVett: 3 8 1 2 3 0 0 0 0 0
.globl main
.text
main:
	la $a0 mioVett
	jal printAll	#mioVett.printAll() || printAll(mioVett)
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
	add $sp $fp -12 
	
	lw $s0 $a0 	#s0 = len
	add $s0 $s0 2 	#s0 = last
	
	
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	jr $ra