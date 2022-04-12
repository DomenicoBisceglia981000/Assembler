.globl main
.text
main:
	li $t1 0
	li $t3 100
ciclo:
	addi $t1 $t1 1
	beq $t1 $t3 qui #if $t1 == $t3 then break; per decidere dove atterrare abbiamo solo 16 bit -> gli ultimi due bit sono 00 quindi vengono risparmiati, il resto dei bit sarà di quanto devo incrementare o decrementare il Program Counter
	j ciclo
qui:
li $v0 10
syscall
#possiamo saltare di 15 bit con la branch, quindi avanti e indietro di 2^15 istruzioni (32000 istruzioni avanti o indietro)
#se dovessimo saltare più lontano combinerò il salto condizionato con un salto non condizionato (ovvero una jump)