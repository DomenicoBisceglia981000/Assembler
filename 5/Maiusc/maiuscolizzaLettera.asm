.data

.globl maiuscolizzaLettera

.text

# funzione maiuscolizzaLettera
#
# PARAMETRI:
# $a0: il codice ascii di una lettera
# USCITE:
# $v0: la sua versione maiuscola (o la lettera stessa se non era a-z)

maiuscolizzaLettera:
	blt $a0 97 fineFunz	#if a0 < 'a' then fine
	bgt $a0 122 fineFunz	#if a0 > 'z' then fine
	addi $a0 $a0 -32
fineFunz:
	move $v0 $a0
	jr $ra