.MODEL SMALL 
.STACK 100H
.DATA
    NL DB 13,10,'$' ;DOLLAR FOR THE END OF THE ARRAY ;13 FOR CARIAGE RETURN (CURSOR AT FIRST ; 10 IS NEW LINE 
    
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 5   ;LOOP COUNTER =5
    
    
    LOOP_PRINT:
        MOV DL, CL
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        MOV DL, ' '
        MOV AH, 02H
        INT 21H
        
        LOOP LOOP_PRINT        ;--CX HAPPENS, IF CX!=0 THEN JUMP TO LOOP_PRINT LEVEL
        
    LEA DX, NL          ;PRINT NEW LINE
    MOV AH, 09H
    INT 21H
    
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN