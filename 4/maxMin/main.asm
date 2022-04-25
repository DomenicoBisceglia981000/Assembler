#Si implementi la procedura max così definita:
#- input: un numero intero N e un array A di N interi
#- output: il valore massimo in A
#Si implementi la pricedura min così definita:
#- input: un intero N e un array A di N interi
#- output: il valore minimo in A
#Si implementi infine il main che acquisisca i dati, chiami max e min e stampi i risultati restituiti.
.data
mioArray: 12 3 31 0 100 1000
msgMin: .asciiz "il minore dei numeri è : "
msgMax: .asciiz "il maggiore dei numeri è : "
.globl main
.text
main:
	li $a0 6	# tutte queste 4 righe ad alto livello sono:
	la $a1 mioArray		# s0 = trovaMin(6, mioArray)
	jal trovaMin		# 
	move $s0 $v0		# 
	
	li $v0 4
	la $a0 msgMin
	syscall #scrivi msg
	
	li $v0 1
	move $a0 $s0
	syscall #scrivi s0 
	
	li $a0 6	# tutte queste 4 righe ad alto livello sono:
	la $a1 mioArray		# s0 = trovaMin(6, mioArray)
	jal trovaMax		# 
	move $s0 $v0
	
	li $v0 4
	la $a0 msgMax
	syscall 
	
	li $v0 1
	move $a0 $s0
	syscall  
	
	
	li $v0 10
	syscall		#exit
