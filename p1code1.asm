.MODEL SMALL
 .STACK 100H

 .CODE
   MAIN PROC
     MOV AH, 2                    ; display the character '@'.    now display the character '#'.
     MOV DL, "#"
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN