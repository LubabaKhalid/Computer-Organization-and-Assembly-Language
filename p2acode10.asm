TITLE AL-020 : An AL Program that reads a digit, computes and prints 'P' if
              ; it is positive, 'N' if it is negative and 'Z' if it is zero
              ; (Simulation of switch-case statement).

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'Enter the digit : $'
    MSG     DB  'The entered digit is : $'

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     LEA DX, PROMPT               ; Load and print PROMPT
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a character
     INT 21H

     MOV BL, AL                   ; Save input character to BL

     ; Convert ASCII character to actual digit
     SUB BL, '0'                   ; Convert from ASCII to numeric value

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, MSG                  ; Load and print MSG
     MOV AH, 9
     INT 21H

     CMP BL, 0                    ; Compare the numeric value with zero

     JL @NEGATIVE                 ; Jump to label @NEGATIVE if the digit is negative
     JZ @ZERO                     ; Jump to label @ZERO if the digit is zero
     JG @POSITIVE                 ; Jump to label @POSITIVE if the digit is positive

     @NEGATIVE:                   ; Label for negative digit
       MOV DL, 'N'
       JMP @DISPLAY               ; Jump to @DISPLAY to print 'N'

     @ZERO:                       ; Label for zero
       MOV DL, 'Z'
       JMP @DISPLAY               ; Jump to @DISPLAY to print 'Z'

     @POSITIVE:                   ; Label for positive digit
       MOV DL, 'P'
       JMP @DISPLAY               ; Jump to @DISPLAY to print 'P'

     @DISPLAY:                    ; Print the result character
       MOV AH, 2
       INT 21H

     MOV AH, 4CH                  ; Return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
