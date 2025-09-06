.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER A NUMBER (0-9): $"
    
    RESMSG DB 0DH, 0AH, "ANS= $"
    NUM1 DB ?
    NUM2 DB 8H 
    ANS DB ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;PROMT FOR NUMBER
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    
    ;READ FIRST NUMBER
    MOV AH, 01H
    INT 21H
    SUB AL, 30H     ;CONVERT ASCII TO NUMBER
    MOV NUM1, AL
    
    
    ;PERFORM OPERATION
    MOV AL, NUM2
    SUB AL, NUM1
    SUB AL, NUM1
    MOV ANS, AL
    
    ;DISPLAY
    MOV AH, 09H
    LEA DX, RESMSG
    INT 21H
    
    MOV AL, ANS
    ADD AL, 30H     ;CONVERT TO ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    ;EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
    