.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER A NUMBER (0-4): $"
    MSG2 DB 0DH, 0AH, "ANOTHER ONE (0-4): $"
    ;MSG2 = 0DH, 0AH + 30 BYTES OF STRING= 32 
    
    RESMSG DB 0DH, 0AH, "SUM= $"
    
    NUM1 DB ?
    NUM2 DB ?
    SUM DB ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;PROMT FOR FIRST NUMBER
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    
    ;READ FIRST NUMBER
    MOV AH, 01H
    INT 21H
    SUB AL, 30H     ;CONVERT ASCII TO NUMBER
    MOV NUM1, AL
    
    ;PROMT FOR 2ND NUMBER
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H
    
    ;READ 2ND NUMBER
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL
    
    ;PERFORM ADDITION 
    MOV AL, NUM1
    ADD AL, NUM2
    MOV SUM, AL
    
    ;DISPLAY
    MOV AH, 09H
    LEA DX, RESMSG
    INT 21H
    
    MOV AL, SUM
    ADD AL, 30H     ;CONVERT TO ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    ;EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
    