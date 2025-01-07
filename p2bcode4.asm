TITLE AL-024 : An AL Program to print Upper Case Letters from A to Z
              ; ( Simulation of While Loop ).

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The Upper Case Letters from A to Z are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 41H                  ; initialize DL=A

     @WHILE_LOOP:                 ; loop label
       CMP CX, 0                  ; compare CX and 0

       JE @END_LOOP               ; jump to label @END_LOOP if CX=0

       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JMP @WHILE_LOOP              ; jump to label @WHILE_LOOP

     @END_LOOP:                   ; jump label

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
