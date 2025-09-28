.MODEL SMALL
.STACK 100h
.DATA
    NL DB 13,10,'$'          ; newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV BL, 0                ; start at 0
    MOV CX, 5                ; five evens: 0,2,4,6,8

PRINT_LOOP:
    ; print current even digit
    MOV DL, BL
    ADD DL, '0'
    MOV AH, 02h
    INT 21h

    MOV DL, ' '
    MOV AH, 02h
    INT 21h

    ADD BL, 2                
    LOOP PRINT_LOOP

    LEA DX, NL
    MOV AH, 09h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
