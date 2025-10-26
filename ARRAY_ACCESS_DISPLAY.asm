;MANY WAYS TO REPRESENT ARRAY

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA
    NUMBER DB 0, 1, 2, 3, 4, 5, 6, 7, 8, 9            ;Data Byte= 8bit
    
    NUMBER2 DW 65, 66, 67, 68, 69                     ;Data Word= 2byte=16bit   A,B,C,D

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, NUMBER2     ;Number2's first element's address assign in source-index register
    MOV CX, 5           ;number of count the loop will execute
    MOV AH, 2
    PRINT "NUMBER 2: "
    PRINTN
    
    FOR:
        MOV DL, [SI]       ;first element moved to dl    
        INT 21H
        PRINTN
        
        ADD SI,2           ;EACH ELEMENT IS 2BYTE LIKE 00,01 IS 65, THEN 02,03 IS 66
        LOOP FOR
        
        
        PRINT "NUMBER: "
        PRINTN
        MOV SI, OFFSET NUMBER
        MOV CX, 10
        MOV AH, 2
    FOR2:
        MOV DL, [SI]
        ADD DL, '0'
        INT 21H
        PRINTN
        
        ADD SI, 1
        LOOP FOR2
        
        
        PRINT "NUMBER <1 BYTE: ADD 1 WITH SI/BX: "
        PRINTN
        MOV BX, 0                 ;BASE REGISTER 
        MOV CX, 10
        MOV AH, 2
        
    FOR3:
        MOV DL,  NUMBER[BX]  
        ADD DL, '0'
        INT 21H
        PRINTN
        
        ADD BX, 1        ;EACH ELEMENT 1BYTE
        LOOP FOR3
        
