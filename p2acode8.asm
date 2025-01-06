TITLE AL-018 : An AL Program that reads a character and prints it only if it
              ; is '?' ( Simulation of If structure ).   now check '@'

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'Enter the character : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a character
     INT 21H

     MOV BL, AL                   ; save the input character into BL

     CMP BL, "@"                  ; compare the input character and '?'   now compare with '@'
     
     JNZ @EXIT                    ; jump to label @EXIT if input character is
                                  ; not equal to '@'

     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H

     MOV AH, 2                    ; print the input character
     MOV DL, BL
     INT 21H

     @EXIT:                       ; jump label

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN