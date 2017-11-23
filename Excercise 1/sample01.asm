%include  "io.mac"

.DATA
nfo_1	      db   '*******************************************',0
nfo_2         db   '*       Jose Luis Fernandez Mateo         *',0
name_msg      db   'Please enter your name: ',0
query_msg     db   'How many times to repeat welcome message? ',0
confirm_msg1  db   'Repeat welcome message ',0
confirm_msg2  db   ' times? (y/n) ',0 
welcome_msg   db   'Welcome to Assembly Language Programming ',0
cancel_msg    db   'You cancelled the Operation',0

.UDATA
user_name    resb  16             ; buffer for user name
response     resb  1

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
     PutStr  name_msg            ; prompt user for his/her name
     GetStr  user_name,16        ; read name (max. 15 characters)
ask_count:
     PutStr  query_msg           ; prompt for repeat count
     GetInt  CX                  ; read repeat count
     PutStr  confirm_msg1        ; confirm repeat count
     PutInt  CX                  ; by displaying its value
     PutStr  confirm_msg2
     GetCh   [response]          ; read user response
     cmp     byte [response],'y' ; if 'y', display welcome message
     jne     back                ; otherwise, request repeat count
display_msg:
     PutStr  welcome_msg         ; display welcome message
     PutStr  user_name           ; display the user name
     nwln
     loop    display_msg         ; repeat count times
     jmp     done
back:
     PutStr  cancel_msg
     nwln
done:

.EXIT      
