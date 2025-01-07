
TITLE AL-013 : An AL Program to
              ; (a) display "!",
              ; (b) read three initials,
              ; (c) display them in the middle of a 12*12 box of asterisks,
              ; (d) beep the computer.

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT     DB  0DH,0AH,'Enter three initials : $'
    ASTERISKS  DB  '************$',0   ; 12 asterisks for the box width
    NEXT_LINE  DB  0DH,0AH,"$"          ; For line break
    SPACES     DB  '            $'       ; 12 spaces for positioning initials

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     ; Display "!"
     MOV AH, 2                    ; Display a single character
     MOV DL, "!"
     INT 21H

     ; Prompt user for initials
     LEA DX, PROMPT               ; Load and display the string PROMPT
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read first initial
     INT 21H
     MOV BL, AL                   ; Save first initial in BL

     INT 21H                      ; Read second initial
     MOV BH, AL                   ; Save second initial in BH

     INT 21H                      ; Read third initial
     MOV CL, AL                   ; Save third initial in CL

     LEA DX, NEXT_LINE            ; Load and display the string NEXT_LINE
     MOV AH, 9
     INT 21H

     ; Now, print the 12x12 box
     ; First, print the top border of asterisks
     LEA DX, ASTERISKS
     MOV AH, 9
     INT 21H

     ; Print 10 lines with spaces for initials
     MOV SI, 0                    ; Counter for 10 middle lines
     PRINT_LINES:
         LEA DX, SPACES            ; Load spaces for the line
         MOV AH, 9
         INT 21H
         INC SI
         CMP SI, 10                ; Check if we've printed 10 lines
         JL PRINT_LINES

     ; Print the bottom border of asterisks (same as top)
     LEA DX, ASTERISKS
     MOV AH, 9
     INT 21H

     ; Place the initials in the middle (6th line, 6th-8th position)
     ; Move to line 6
     LEA DX, SPACES
     MOV AH, 9
     INT 21H

     ; Place initials
     MOV DL, BL
     MOV AH, 2
     INT 21H

     MOV DL, BH
     MOV AH, 2
     INT 21H

     MOV DL, CL
     MOV AH, 2
     INT 21H

     ; Beep the computer
     MOV AH, 2
     MOV DL, 7H                  ; ASCII bell character for beep
     INT 21H

     ; Return control to DOS
     MOV AH, 4CH
     INT 21H
   MAIN ENDP

END MAIN
