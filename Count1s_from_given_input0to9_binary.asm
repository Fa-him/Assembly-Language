.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 0DH,0AH,'ENTER A DIGIT (0-9): $'
    MSG    DB 0DH,0AH,'COUNT OF 1s: $'
    CRLF   DB 13,10,'$'
    NUM    DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET PROMPT
    MOV AH, 09H
    INT 21H

    MOV AH, 01H            
    INT 21H
    SUB AL, '0'            
    MOV NUM, AL

    MOV DX, OFFSET MSG
    MOV AH, 09H
    INT 21H

    XOR BL, BL             
    MOV AL, NUM            
    MOV CX, 8              
COUNT_LOOP:
    MOV DL, AL
    AND DL, 1              
    ADD BL, DL             
    SHR AL, 1              
    LOOP COUNT_LOOP

    MOV DL, BL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; newline and exit
    MOV DX, OFFSET CRLF
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
