.MODEL SMALL 
.STACK 100H
.DATA
    NL DB 13,10,'$' 
    
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    MOV BL, 0
    MOV CX, 10   
             
    
    
    LOOP_PRINT:  
        MOV DL, 1                  ;1 IS FIXED :) FOR EACH ITERATION IT'S A VISUAL HACK ;)
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        MOV DL, BL
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        INC BL
        
        MOV DL, ' '
        MOV AH, 02H
        INT 21H
        
        LOOP LOOP_PRINT        
        
    LEA DX, NL          
    MOV AH, 09H
    INT 21H
    
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN