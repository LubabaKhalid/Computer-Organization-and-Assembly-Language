TITLE AL-016 : An AL Program to print Upper Case Letters from A to Z.         now print lower case Letters from a to z

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The Lower Case Letters from a to z are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 2                    ; set output function  
   ;  MOV DL, 65                   ; set DL with A
      MOV DL, 97                   ; set DL with a

     @LOOP:                       ; loop start
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
 
     JNZ @LOOP                    ; jump to label @LOOP if CXis 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN