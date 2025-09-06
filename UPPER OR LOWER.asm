.MODEL SMALL
.STACK 100H
.DATA
    NUM DB ?
    MSG DB 'UPPER: $'
    MSG2 DB 'LOWER: $'
                   
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    
    CMP AL, 'A'
    JNGE LOWER
    CMP AL, 'Z'
    JNLE LOWER
    

UPPER:
    LEA DX, MSG
    MOV AH, 9
    INT 21H
    JMP EXIT

LOWER:
    LEA DX, MSG2
    MOV AH,9
    INT 21H
    
    
EXIT:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP 
END MAIN