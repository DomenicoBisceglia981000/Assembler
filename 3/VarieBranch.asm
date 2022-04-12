.globl main
.text
main:
	li $t1 0
	li $t3 100
ciclo:
	addi $t1 $t1 1
	beq $t1 $t3 qui
	bne #salta se non sono uguali
	blt #salta se sono minori 
	bgt #branch on greater than
	ble #branch less equal
	...
	j ciclo
qui:
li $v0 10
syscall