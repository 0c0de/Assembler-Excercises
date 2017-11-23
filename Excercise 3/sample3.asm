;Assembly language program to find sum   SUMPROG.ASM
;
;         Objective: To add two integers.
;            Inputs: Two integers.
;            Output: Sum of input numbers.
%include  "io.mac"

.DATA
addnum_msg    db   'Please enter the number to add(0 to exit) ',0
overflow_msg  db   'An overflow occurred',0
 
.UDATA

 
.CODE
      .STARTUP
      xor EAX, EAX
      MOV CX,5
data_input:
      xor      EBX, EBX
      PutStr   addnum_msg
      GetLInt  EBX
      ADD      EAX, EBX
      CMP      EBX, 0
      JE       done
      dec      CX
      jnz      data_input  
done:
      PutLInt  EAX
      nwln
      .EXIT
