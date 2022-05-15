#for (i=2;i<n;i++) do {
#	if(n%i==0) then return NO
#}
#return YES
#
.data
.asciiz primoST: "primo"
.asciiz nonPrimoST: "NON primo"

.text
main:
	li $v0 5
	syscall
	
	move $a0 $v0 
	jal isPrime
	
	la $v0 primoST #se v0==1
	la $s1 nonPrimoST #se v0==0
	
	move $a0 $s0
	beqz $v0 else #if (v0==0) go to else
	move $a0 $s1
else:	li $v0 4 
	syscall
	
isPrime:
	li $t1 2
cicloFor:
	bge $t1 $a0 fineCiclo
	div $a0 $t1
	mfhi $t2
	beqz returnNo
	add $t1 $t1 1
	j cicloFor
fineCiclo:
	li $v0 1
	jr $ra
returnNo: 
	li $v0 0
	jr $ra	
	