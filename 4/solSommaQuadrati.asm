.globl main
.data

.text
main:
	li $v0 5 
	syscall
	move $s0 $v0 		#V è in s0
	li $v0 5 
	syscall
	move $s1 $v0 		# N è in s0

	move $s2 $s0 		# (s2)SUM = s0

	li $s3 1 		# i=1, s3=i
ciclo:
	bge $s3 $s1 fineCiclo 	#if(i>=N) then go to FineCiclo
	mul $t0 $s3 $s3 	# t0 = i*i
	rem $t1 $t0 $s0		# t1 = i*i % V, se è 0 allora salto a fine ciclo
	beqz $t1 fineCiclo
	add $s2 $s2 $t0 	# sum = sum + i*i
	addi $s3 $s3 1 		# i=i+1
	j ciclo
fineCiclo:
	move $a0 $s2
	li $v0 1
	syscall