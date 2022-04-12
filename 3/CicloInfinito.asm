.globl main
.text
main:
	li $t1 0
ciclo:
	li $t2 6
	add $t1 $t1 $t2
	
	j ciclo
	
li $v0 10
syscall