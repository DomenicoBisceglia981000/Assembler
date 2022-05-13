#func fattoriale (int n) int{
#	if (n==0) return 1;
#
#	t0 = fattoriale (n-1)
#	return n*t0
#
#}

main:
	li $a0 4
	jal fattoriale 	#v0 <== fattoriale (a0)

	move $a0 $v0
	li $v0 1
	syscall	#print ($v0)
	
	li $v0 10
	syscall


fattoriale:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $s2 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $t0 -12($fp)
	
	#corpo
	move $s2 $a0		#s2 = il parametro n (numero di cui calcolare il fattoriale)
	beqz $s2 casoBase	
casoRicorsivo:
	addiu $a0 $s2 -1	# \
	jal fattoriale		#  > v0 = fattoriale (a0-1)
	move $v0 $t0		# /
	
	mul $v0 $s2 $t0
	j fine
casoBase:
	li $v0 1
fine:
	#epilogo
	lw $s2 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $t0 -12($fp)
	move $t0 $fp
	jr $ra	