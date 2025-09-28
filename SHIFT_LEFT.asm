.MODEL SMALL
.STACK 100H
.DATA
    NUM DB 2
    MSG_1 DB 0DH, 0AH, 'NUMBER BEFORE SHL: $'
    MSG DB 0DH, 0AH, 'RESULT AFTER SHL(2BIT): $'
    CRLF DB 13,10,'$'
   
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET MSG_1
    MOV AH, 09H
    INT 21H
    
    MOV DL, NUM
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    
    MOV DX, OFFSET MSG
    MOV AH, 09H
    INT 21H
    
    MOV AL, NUM
    
    MOV CL, 2
    SHL AL, CL
    
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    MOV DX, OFFSET CRLF
    MOV AH, 09H
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP 
END MAIN