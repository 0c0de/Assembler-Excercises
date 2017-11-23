%include  "io.mac"

.DATA
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0
prompt1_msg  db  'Enter first number: ',0
prompt2_msg  db  'Enter second number: ',0
sum_msg      db  'Sum is: ',0
error_msg    db  'Overflow has occurred!',0
 
.UDATA
number1      resd  1        ; stores first number
number2      resd  1        ; stores first number
sum          resd  1        ; stores sum  
 
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
      ; prompt user for first number
      PutStr  prompt1_msg
      GetLInt [number1]
      
      ; prompt user for second number
      PutStr  prompt2_msg
      GetLInt [number2]

      ; find sum of two 32-bit numbers
      mov     EAX,[number1]
      add     EAX,[number2]
      mov     [sum],EAX
      ; check for overflow
      jno     no_overflow
      PutStr  error_msg
      nwln
      jmp     done
      ; display sum
no_overflow:
      PutStr  sum_msg
      PutLInt [sum]
      nwln 
done:
      .EXIT
