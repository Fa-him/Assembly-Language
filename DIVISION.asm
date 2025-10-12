.MODEL SMALL
.STACK 100H
.DATA              
    
.CODE   
MAIN PROC
        
    MOV AX, -1250
    CWD          ;16bit
    MOV BX, 7           ;8bit
    
    IDIV BX              ;QUITIENT->AL, REMINDER->AH
    
       
    
    
MAIN ENDP
END MAIN     







; DIV DIVISOR
; THE DEVISOR IF 8 BIT, THEN AX IS THE MAIN DEVIDEND, AL IS THE RESULT AND AH IS THE REMAINING

; IF ITS 16BIT, THEN DIVIDEND IS DXAX AND RESULT IS AX AND REMIANING WILL BE IN DX