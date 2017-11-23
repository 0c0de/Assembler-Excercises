;Assembly language program to find sum   SUMPROG.ASM
;
;         Objective: To add two integers.
;            Inputs: Two integers.
;            Output: Sum of input numbers.
%include  "io.mac"

.DATA
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0
addname_msg   db   'Please enter a name ',0
addname2_msg  db   'Please enter another name to compare ',0
error_msg     db   'Name is not equal ',0
correct_msg   db   'Your name is the same ',0

.UDATA
first_name	resb	14
second_name	resb	14
str1_len	equ	$-first_name
str2_len	equ	$-second_name
 
.CODE
      .STARTUP
checkgreater:
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
	PutStr	addname_msg
	GetStr	first_name
	lea	ESI, [first_name]
	PutStr	addname2_msg
	GetStr	second_name
	lea	EDI, [second_name]
	mov	CL, str1_len
	mov	DL, str2_len
	cmp	CL,DL
	jg	setFirstStr
follow:
	mov	ECX, str2_len
	rep	cmpsb	
	jne	err
	PutStr	correct_msg
	jmp	exitProc
err:
	PutStr	error_msg
	jmp	exitProc	
setFirstStr:
	mov	ECX, str1_len
	jmp	follow
exitProc:

.EXIT
