TITLE AL-026 : An AL Program to display a "?", read two small letters, and
              ; display them on the next line in alphabetical order.

 .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1   DB  'Enter the first capital letter : $'
   PROMPT_2   DB  'Enter the second capital letter : $'
   PROMPT_3   DB  'The given capital letters in alphabetical order are : $'
   NEXT_LINE  DB  0DH,0AH,"$"

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     MOV AH, 2                    ; display the character "&"
     MOV DL, "&"
     INT 21H

     MOV AH, 9                    ; set string output function

     LEA DX, NEXT_LINE            ; load and display the string NEXT_LINE
     INT 21H

     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     INT 21H

     MOV AH, 1                    ; set input function
     INT 21H                      ; read first character

     MOV BL, AL                   ; save first character into BL

     MOV AH, 9                    ; set string output function

     LEA DX, NEXT_LINE            ; load and display the string NEXT_LINE
     INT 21H

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     INT 21H

     MOV AH, 1                    ; set input function
     INT 21H                      ; read second character

     MOV BH, AL                   ; save second character into BH

     MOV AH, 9                    ; set string output function

     LEA DX, NEXT_LINE            ; load and display the string NEXT_LINE
     INT 21H

     LEA DX, PROMPT_3             ; load and display the string PROMPT_3
     INT 21H

     MOV AH, 2                    ; set output function

     CMP BL, BH

     JAE @GREATER
       MOV DL, BL
       INT 21H

       MOV DL, BH
       INT 21H

       JMP @END

     @GREATER:
       MOV DL, BH
       INT 21H

       MOV DL, BL
       INT 21H

     @END:

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN