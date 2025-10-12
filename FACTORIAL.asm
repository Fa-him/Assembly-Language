.MODEL SMALL
.STACK 100H
.DATA
    A DB 5          
    
.CODE   
MAIN PROC
        
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 1
    MOV CX, 5 
    
  REPEAT: 
    
    MUL CX
    LOOP REPEAT ;FINAL OUTPUT WILL STORE IN AX
    
    
MAIN ENDP
END MAIN