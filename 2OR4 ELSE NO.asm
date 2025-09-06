.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 0DH,0AH,'ENTER A NUMBER:$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; FIX: DS MUST POINT TO DATA SEGMENT

    MOV AH, 9
    LEA DX, MSG
    INT 21H

    MOV AH, 1               ; READ CHARACTER
    INT 21H                 ; RESULT IN AL

    CMP AL, '2'             ; CHECK IF '2'
    JE TOP
    CMP AL, '4'             ; CHECK IF '4'
    JE TOP
    JMP NO

TOP:
    MOV DL, 'Y'             ; FIX: USE AH=2 TO PRINT ONE CHAR
    MOV AH, 2
    INT 21H
    JMP EXIT

NO:
    MOV DL, 'N'
    MOV AH, 2
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
