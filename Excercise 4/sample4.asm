%include  "io.mac"

.DATA
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0
addnum_msg    db   'Please enter the number first number to multiply ',0
addnum2_msg   db   'Please enter the second number to multiply ',0
 
.UDATA

 
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
	xor 	AX, AX
	xor	BX, BX
	PutStr	addnum_msg
	GetInt	AX
	PutStr	addnum2_msg
	GetInt	BX
multiply:
	add	CX,AX
	dec	BX
	jnz	multiply
	PutInt	CX
	nwln
.EXIT
