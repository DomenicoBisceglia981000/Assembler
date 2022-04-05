#push
#addi $sp $sp -4
#sw $s0 ($sp)

#pop
#ls $s1 ($sp)
#addi $sp $sp 4

#MOLTIPLICAZIONE
#mult $s0 $s1
#mfhi $s4
#mflo

#mul $s4 $s0 $s1 #se ho overflow è in remHi

#DIVISIONE
#hi = resto
#lo = quante volte ci sta
#div $s0 $s1
#mflo $s3

#div $s3 $s0 $s1 #il resto se lo vogliamo è in remHi



#si supponga che mips abbia solo i registri t0 e s0
#si scrive il codice che:
	#calcoli la somma dei primi tre numeri interi positivi, ciascuno moltiplicato per 3
	#non si utilizzi la pseudo-istruzione mul

#lo scopo è calcolare: 1*3 + 2*3 + 3*3
.data


.text
li $s1 1
li $s2 2
li $s3 3
mul $t0 $s1 $s3
mul $t1 $s2 $s3
mul $t2 $s3 $s3 
add $t0 $t0 $t1
add $t0 $t0 $t2




