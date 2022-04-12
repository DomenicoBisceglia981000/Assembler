.globl main
.text
main:
	li $t1 100
	li $t2 50
	#if (t1<t2) then t0 = t1; else t0=t2
	blt $t1 $t2 ramoThen
	move $t0 $t2 #non ho bisogno di etichettare l'else, perchè se lo svolgo vuol dire che non ho saltato	
	j end
ramoThen:
	move $t0 $t1
end:
li $v0 10
syscall