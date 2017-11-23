%include  "io.mac"

.DATA
str_msg    db   'Please enter the text to reverse: ',0
len_msg	   db   'Lenght of text is: ',0	
rev_msg   db    'Your text reversed is: ',0
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0

.UDATA
text_msg   resb   32
rev_str    resb   32
len_num    resb   4
str_offset resb	  19
.CODE
      .STARTUP
	xor 	AL,AL
	xor	ESI,ESI
	xor	EDI,EDI
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
	PutStr	str_msg
	GetStr	text_msg
count:	
	mov 	AL, byte[text_msg+ESI]
	push	ESI	
	inc	ESI	
	cmp	AL, 1
	jae	count
	DEC	ESI
	mov	DX, SI
	XOR	AL,AL
	PutStr	rev_msg
reverse:
	mov	AL, byte[text_msg+ESI]
	DEC	ESI	
	pop	EDI
	MOV	byte[text_msg+EDI],AL
	CMP	AL, ''
	JE	reverse
	PutCh	AL
	DEC	DX
	CMP	DX,0
	JNE	reverse	
	INC	ESI
	nwln
	
.EXIT
