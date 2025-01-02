TITLE AL-009 : An AL Program to read a character and display it on a new line
              ; with user prompts initialized by constants.
              ; Now read two characters and print them on two separate lines.

.MODEL SMALL
.STACK 100H
.DATA
    MSG_1  DB  'Enter the first character : $'
    MSG_2  DB  0DH,0AH,'The given character is : $'   ; Newline after prompt
    MSG_3  DB  'Enter the second character : $'        ; New line added
    MSG_4  DB  0DH,0AH,'The given character is : $'    ; New line added

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     ; Display first prompt
     LEA DX, MSG_1                ; Load and display MSG_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                     ; Read a character (function 1)
     INT 21H

     MOV BL, AL                    ; Save the first character into BL

     ; Display second prompt
     LEA DX, MSG_2                ; Load and display MSG_2 (includes newline)
     MOV AH, 9
     INT 21H

     MOV AH, 2                     ; Display the character
     MOV DL, BL
     INT 21H

     ; Display third prompt
     LEA DX, MSG_3                ; Load and display MSG_3
     MOV AH, 9
     INT 21H

     MOV AH, 1                     ; Read a character (function 1)
     INT 21H

     MOV BL, AL                    ; Save the second character into BL

     ; Display fourth prompt
     LEA DX, MSG_4                ; Load and display MSG_4 (includes newline)
     MOV AH, 9
     INT 21H

     MOV AH, 2                     ; Display the character
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                   ; Return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
