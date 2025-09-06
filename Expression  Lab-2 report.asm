.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter the first number (A): $"
    MSG2 DB 0DH, 0AH, "Enter the second number (B): $"
    MSG3 DB 0DH, 0AH, "Result of 5 - 3*A + B = $"
    
    NUM1 DB ?  ; Store for A
    NUM2 DB ?  ; Store for B
    RESULT DB ? ; Store for the result

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt for the first number (A)
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Read the first number (A)
    MOV AH, 01H
    INT 21H
    SUB AL, 30H  ; Convert ASCII to number
    MOV NUM1, AL

    ; Print prompt for the second number (B)
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Read the second number (B)
    MOV AH, 01H
    INT 21H
    SUB AL, 30H  ; Convert ASCII to number
    MOV NUM2, AL

    ; Perform the arithmetic: 5 - 3*A + B
    MOV AL, NUM1        ; Load A into AL
    MOV BL, 03          ; Load 3 into BL
    MUL BL              ; Multiply A by 3 (AL = A * 3)
    
    MOV CL, 05          ; Load 5 into CL
    SUB CL, AL          ; 5 - (3 * A)
    
    MOV DL, NUM2        ; Load B into DL
    ADD CL, DL          ; 5 - 3*A + B = RESULT
    
    MOV RESULT, CL      ; Store the result
    
    ; Print the result message
    MOV AH, 09H
    LEA DX, MSG3
    INT 21H
    
    ; Display the result
    MOV AL, RESULT
    ADD AL, 30H         ; Convert result to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
