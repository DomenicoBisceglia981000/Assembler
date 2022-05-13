.data
nome: .asciiz "pinuccio"
cognome: .asciiz "lanfranchi"
accapo: .asciiz "\n" 	#oppure: .byte 10 0
.globl main
.text
main:
	la $a0 nome
	jal maiuscolizzaStringa
	la $a0 cognome
	jal maiuscolizzaStringa
	la $a0 nome
	li $v0 4
	syscall
	la $a0 accapo
	li $v0 4
	syscall
	la $a0 cognome
	li $v0 4
	syscall
	
end:	li $v0 10
	syscall