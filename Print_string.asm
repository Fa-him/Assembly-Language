.MODEL SMALL  ;MEMORY MODEL (1 CODE+ 1 DATA SEGMENT) 
.STACK 100H
.DATA 
    
    MSG DB "HELLO, WORLD$"
    
.CODE

MAIN PROC
     
     MOV AX, @DATA
     MOV DS, AX  
     
     ; PRINT THE STRING
     LEA DX, MSG
     MOV AH, 09H
     INT 21H 
     ; EXIT THE PROGRAM 
     MOV AH, 4CH
     INT 21H
    
    
   
MAIN ENDP
     END MAIN