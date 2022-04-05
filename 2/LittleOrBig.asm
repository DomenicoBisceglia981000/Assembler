.data #boiler plate --> codice che va scritto sempre!
qua: #ogni etichetta si riferisce al prossimo valore nel segmento dati
0xAABBCCDD
qui: # : identifica che quello che lo precede è un'etichetta
#.byte 1 0 0 0 #da qui in poi quello che metto non sono parole, ma byte 
#.word 88 44 #posso tornare a scrivere in word
msg:
#.byte 78 11 119 32 72 105 114 105 110 103 0

.asciiz "ciao mamma"  #la z sta a significare che alla fine deve essere messo uno 0
.byte 1
.byte 2
.align 4 #per dire alla macchina di allinearsi a 4 byte
peso:
.word 1024 #se ilmessaggio sopra ha un numero di byte non divisibile per 4, DEVO ALLINEARE I BYTE!!!! FALSO! si allineano da soli!
.text #boiler plate --> codice che va scritto sempre!
zap: #posso usare le etichette anche nel segmento di testo
la $t0 peso #load address --> vuole un'etichetta nel comando
#li $t1 0x01020304 #load immediate
#sb $t1 1($t0)
lw $t1 ($t0)
