;DECIMAL OUTPUT SHOW

.MODEL SMALL
.STACK 100H
.DATA              
    
.CODE   
MAIN PROC
        
     MOV AX, -122
     
     ;SAVE REGISTERS
     PUSH AX
     PUSH BX
     PUSH CX
     PUSH DX
     
     
     OR AX,AX    ;SIGN FLAG(NEG=1,POS=0) AND OVERFOLW=0(FLAG REGISTERS)
     JGE END_IF1 ;AX>0 JMP IF SF==OF
     
     PUSH AX
     MOV DL, '-'
     MOV AH, 2
     INT 21H
     POP AX
     NEG AX      ;CHANGED TO POSITIVE ;)
     
  END_IF1:
     
     MOV CX,0
     MOV BX,10D
     
     REPEAT:
        XOR DX,DX
        DIV BX
        PUSH DX
        INC CX      ;HOW MANY TIMES PUSHED IN STACK 
        
        OR AX,AX
        JNE REPEAT  ;JMP IF AX!=0
        
     PRINT:
        POP DX
        OR DL, 30H  ;MAKE IT ASCII
        MOV AH,2
        INT 21H
        
        LOOP PRINT  ;CX WILL DEC EACH TIME
        
     ;RESTORE
     POP DX
     POP CX
     POP BX
     POP AX
     
     MOV AH, 4CH
     INT 21H
      
    
MAIN ENDP
END MAIN     







