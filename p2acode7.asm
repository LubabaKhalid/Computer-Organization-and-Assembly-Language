TITLE AL-017 : An AL Program to print Lower Case Letters from 'z' to 'a' in reverse order.

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'The Lower Case Letters from z to a are: $'

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; Load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; Initialize CX to 26 (for 26 letters)

     MOV AH, 2                    ; Set output function for printing characters  
     MOV DL, 122                   ; Set DL to 'z' (ASCII value 122)

     @LOOP:                        ; Start the loop
       INT 21H                     ; Print character in DL

       DEC DL                      ; Decrement DL to print previous character
       DEC CX                      ; Decrement CX (loop counter)
       
     JNZ @LOOP                     ; Jump to @LOOP if CX is not zero

     MOV AH, 4CH                   ; Return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
