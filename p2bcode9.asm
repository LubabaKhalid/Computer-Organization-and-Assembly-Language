TITLE AL-029 : An AL Program that prompts a user to enter a line of text.
              ; On the next line, display the lowercase letter entered that comes
              ; first alphabetically and the one that comes last. If no
              ; lowercase letters are entered, display "No Lowercase Letters".

.MODEL SMALL
.STACK 100H

.DATA
   PROMPT_1  DB  'Enter a line of text : $'
   PROMPT_2  DB  0DH,0AH,'First Lowercase Letter : $'
   PROMPT_3  DB  0DH,0AH,'Last Lowercase Letter  : $'
   PROMPT_4  DB  0DH,0AH,' **  No Lowercase Letters  **$'

   FLAG          DB  0             ; Flag to indicate lowercase letters found
   FIRST_LETTER  DB  5Bh           ; Initial value is before 'a' (ASCII 91 = '[')
   LAST_LETTER   DB  40H           ; Initial value is before 'a' (ASCII 64 = '@')

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; Load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Set input function

     @INPUT:                      ; Label to input a character
       INT 21H                    ; Read a character

       MOV BL, AL                 ; Save input character into BL

       CMP BL, 0DH                ; Compare BL with CR (carriage return)
       JE @END_INPUT              ; Jump to @END_INPUT if BL is CR (end of input)

       CMP BL, "a"                ; Compare BL with "a"
       JL @INPUT                  ; If BL < 'a', continue input

       CMP BL, "z"                ; Compare BL with "z"
       JG @INPUT                  ; If BL > 'z', continue input

       ; If BL is between 'a' and 'z', it's a lowercase letter
       MOV FLAG, 1                ; Set FLAG to 1 (indicating lowercase letter found)

       ; Check if the current letter is the first or last alphabetically
       MOV AL, BL
       CMP AL, FIRST_LETTER       ; Compare input character with FIRST_LETTER
       JGE @UPDATE_LAST           ; If input >= FIRST_LETTER, go to update last letter
       MOV FIRST_LETTER, AL       ; Update FIRST_LETTER with the new smallest letter
       JMP @INPUT

     @UPDATE_LAST:
       CMP AL, LAST_LETTER        ; Compare input character with LAST_LETTER
       JLE @INPUT                 ; If input <= LAST_LETTER, continue input
       MOV LAST_LETTER, AL        ; Update LAST_LETTER with the new largest letter
       JMP @INPUT

     @END_INPUT:                  ; End of input, check FLAG
       LEA DX, NEXT_LINE
       MOV AH, 9
       INT 21H

       CMP FLAG, 0                ; Check if no lowercase letter was found
       JE @NO_LETTERS             ; Jump to @NO_LETTERS if FLAG is 0 (no lowercase letter)

       ; Display the first lowercase letter
       LEA DX, PROMPT_2
       MOV AH, 9
       INT 21H
       MOV DL, FIRST_LETTER
       MOV AH, 2
       INT 21H

       ; Display the last lowercase letter
       LEA DX, PROMPT_3
       MOV AH, 9
       INT 21H
       MOV DL, LAST_LETTER
       MOV AH, 2
       INT 21H
       JMP @EXIT

     @NO_LETTERS:                 ; If no lowercase letters were found
       LEA DX, PROMPT_4
       MOV AH, 9
       INT 21H

     @EXIT:
       MOV AH, 4CH                ; Return control to DOS
       INT 21H
   MAIN ENDP

END MAIN
