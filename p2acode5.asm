TITLE AL-015 : An AL Program to print counting from 0 to 9.

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The counting from 0 to 9 is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV bx, 10                   ; initialize cx     use bx instead of cx

     MOV AH, 2                    ; set output function  
     MOV DL, 48                   ; set DL with 0

     @LOOP:                       ; loop label
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC bx                     ; decrement bx
     JNZ @LOOP                    ; jump to label @LOOP if bx is 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN