.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB 0DH,0AH,'AX IS BIGGER THAN CX$'
    MSG2 DB 0DH,0AH,'CX IS BIGGER THAN AX$'
    MSG3 DB 0DH,0AH,'AX IS EQUAL TO CX$'

.CODE
MAIN PROC
    MOV AX, @DATA           ; LOAD DATA SEGMENT
    MOV DS, AX

    MOV AX, 5
    MOV CX, 3

    CMP AX, CX
    JG  TOP                 ; IF AX > CX
    JE  TOP2                ; IF AX == CX
    JMP LABEL               ; ELSE (AX < CX)

TOP:
    LEA DX, MSG
    MOV AH, 9
    INT 21H
    JMP EXIT

TOP2:
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    JMP EXIT

LABEL:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
