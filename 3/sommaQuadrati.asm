#V=<intero inserito dall’utente>;
#N=<intero inserito dall’utente>;
#Sum = V;
#for (i=1; i<N; i++)
#{
#	If ((i*i)%V==0){
#	print «break»;
#	break;
#	}
#	Sum+=i*i;
#}
#print Sum
.globl main
.data
stampaInserimentoNumeri:
.asciiz "Inserisci un numero intero : "
stampaBreak:
.asciiz "BREAK"
.text
main:
la $a0 stampaInserimentoNumeri
li $v0 4
syscall
li $v0 5
syscall #lettura primo valore
move $s0 $v0 #s0 = V
li $v0 4
syscall
li $v0 5
syscall #lettura secondo valore
move $s1 $v0 #s1 = N
move $s4 $s0
li $t0 1
loop:
mult $t0 $t0
mflo $s2
div $s2 $s0
mfhi $s3
beqz $s3 then
add $s4 $s4 $s2
addi $t0 $t0 1
blt $t0 $s1 loop
move $a0 $s4
li $v0 1
syscall
j end

then:
la $a0 stampaBreak
li $v0 4
syscall #stampa break
j end

end:
li $v0 10  
syscall