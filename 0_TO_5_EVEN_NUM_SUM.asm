INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA
    NUMBER DB 0,1,2,3,4,5
.CODE
MAIN PROC  
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 0
    MOV CX, 6
    MOV AL, 0
    
    FOR: 
        MOV DL, NUMBER[BX]
        TEST DL, 1
        JNZ NEXT
        ADD AL, DL
    NEXT: 
        INC BX
        LOOP FOR
          
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
          
        MOV AH, 4CH
        INT 21H
            
MAIN ENDP
END MAIN
