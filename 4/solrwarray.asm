.globl main
.data
array: 9 93 1 3 4 19 3 1 4 3 0 199 100
msg: .asciiz "comando banana"
.align 4
.text
main:
	#lettura a
	li $v0 5
	syscall
	move $s0 $v0	#s0 = a
	#lettura b
	li $v0 5
	syscall
	move $s1 $v0	#s1 = b
	#lettura c
	li $v0 5
	syscall
	move $s2 $v0	#s2 = c
	la $s3 array 	#s3 = inizio di array
	sll $s0 $s0 2 	#s0 *= 4
	add $s0 $s0 $s3 #s0 = indirizzo di array[a]
	sll $s1 $s1 2	#s1 *= 4
	add $s1 $s1 $s3 #s1=indirizzo di array[b]
	lw $t0 ($s0) 	#t0 = valore di array[a]
	lw $t1 ($s1) 	#t1 = valore di array[b]		
	beqz $s2 casec0	#if c = 0 then go to casec0
	beq $s2 1 casec1
	beq $s2 -1 casecm
	j else	

casec0:	sw $t1 ($s0) 	#array[a] = t1
	sw $t0 ($s1) 	#array[b] = t0
	j fineSwitch
casec1:
	sw $t0 ($s1)	#array[b] = t0
	j fineSwitch
casecm:
	sw $t1 ($s0)	#array[a] = t1
	j fineSwitch
else:	
	li $v0 4
	la $a0 msg
	syscall
fineSwitch:
