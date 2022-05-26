# Si implementi una procedura in grado di copiare gli elementi di un array dentro un secondo array in maniera invertita
#
# Es: A=[0, -2, 3, 4] diventa B=[4, 3, -2, 0]
# In particolare:
#  - la procedura prevede 3 input: indirizzo dell'array in input A, indirizzo dell'array di output B e numero di elementi nell'array
#  - gli array vanno allocaty in maniera dinamica nel main
.globl main
.data
A: 4 0 -2 5
B: .space 16

.text
main:
	la $a0 A
	la $a1 B
	li $a2 4
	jal reverseArray
	
	li $v0 10
	syscall