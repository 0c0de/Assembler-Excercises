%include  "io.mac"

.DATA
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0
word_msg      db   'Please enter the ASCII characters ',0
result_msg    db   'Hexadecimal character is: ',0
result_bin    db   'Binary character is: ',0
result_dec    db   'Decimal character is: ',0
hex_table     db   '0123456789ABCDEF',0
dec_table     db   '0123456789',0
decimal_table db   ''

.UDATA
str_word	resd	1

.CODE
      .STARTUP
	nwln
	PutStr	nfo_1
	nwln
	nwln
	PutStr	nfo_2
	nwln	
	nwln	
	PutStr	nfo_1
	nwln
	nwln
hex:
	PutStr	word_msg
	GetCh	AL	
	mov	[str_word], AL
	mov	BL, AL
	mov	AH, AL	
	PutStr	result_msg
	mov	AH, AL
	mov	EBX, hex_table
	shr	AL, 4
	xlatb
	PutCh	AL
	mov	AL,AH
	and	AL, 0FH
	xlatb
	PutCh	AL
	nwln
bin:
	PutStr	result_bin
	mov	AL, [str_word]
	mov	AH, 80H
	mov	CX,8
print_bit:
	test	AL,AH
	jz	print_0
	PutCh	'1'
	jmp	skip1
print_0:
	PutCh	'0'
skip1:
	shr	AH,1
	loop	print_bit
	nwln
decimal:
	xor 	CX, CX	
	PutStr	result_dec
	mov	AL, [str_word]
	movsx	AX, AL
	PutInt	AX 

done:
	
.EXIT
