TITLE AL-012 : An AL Program to display a 10*10 solid box of asterisks with            Now 5*5
              ; INT 21H and function 9H.

 .MODEL SMALL
 .STACK 100H

 .DATA
    SQUARE  DB  '****',0DH,0AH,'$'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, SQUARE               ; load the string
     MOV AH, 9                                           

     INT 21H
     INT 21H                      ; display the string 10 times      Now 5 times
     INT 21H
     INT 21H
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN