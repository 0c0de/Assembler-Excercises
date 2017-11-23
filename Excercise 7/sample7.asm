%include "io.mac"
 ;invertir una frase
.DATA 
n1_msg	db 'Give me a phrase: ',0
n3_msg	db 'The inverted phrase is : ',0

.UDATA
phrase	resb 32
aux	resb 32


.CODE
	.STARTUP
	XOR	ECX,ECX
	XOR 	EBX,EBX
	PutStr	n1_msg
	GetStr	phrase,32
	mov	EBX,phrase
	call 	str_len					
	nwln	
	XOR     EBX,EBX
	XOR	EDI,EDI
	XOR 	ESI,ESI
	
repeat2:		;Ax sera el indice para recorrer una cadena la otra empezara de 0
	
	;PutStr	phrase
	;nwln
	mov     Bl,byte [phrase+ESI]
	cmp	Bl,'a'
	jl	notlower
	cmp	Bl,'z'
	jg	notlower
	xor	Bl,0x20
notlower:
	mov	byte [aux+EDI],Bl
	PutStr  aux
	inc 	EBX
	inc 	ESI
	;inc	EDI
	;nwln
	loop	repeat2
	

	
inversion:
	;PutStr	phrase
	;nwln
	;PutStr	aux
	nwln


ending:
	


.EXIT



str_len:
	push	EBX
	XOR 	ECX,ECX 		;string len = 0
																																																																																																																																	
repeat:
	cmp byte [EBX],0
	Je	str_len_done
	inc	ECX			;contador de tamaño
	inc	EBX			;indice para recorrer el string
	jmp 	repeat	
str_len_done:
	pop EBX	
	ret
	
