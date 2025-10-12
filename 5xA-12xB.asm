; A= 5 x A - 12 x B

.MODEL SMALL
.STACK 100H
.DATA

    A DB 3
    B DB 2
    
.CODE   


MAIN PROC
     ; 13 X 3  ->8bit
     
     ; MOV AL, 3
     ; MOV BL, 13
     
     ; MUL BL     ; OUTPUT WILL STORE AX, IT WILL DO AL*BL
     
     
     ;IF 16bit THEN 
     ; MOV AX, 3
     ; MOV CX, 13
     ; MUL CX   IT WILL AUTOMATICALLY HAPPEN MULTIPLICATION AND STORE IN AX(LOWER 16bit AND DX(UPPER 16bit)
     
     
     MOV AX, @DATA
     MOV DS, AX
     
     MOV AL, 5
     MUL A
     
     MOV CX, AX
     
     MOV AL, 12
     MUL B
                     
     SUB CX, AX
     
     
     
     
     
    
    
MAIN ENDP
     END MAIN
