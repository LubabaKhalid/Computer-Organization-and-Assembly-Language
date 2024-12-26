TITLE AL-033 : An AL Program that reads a number from 0 to 9 and prints EVEN if
              it is even and ODD if it is an odd number (using the TEST instruction).

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1  DB  'Enter the number from 0 to 9 : $'
    PROMPT_2  DB  0DH,0AH,'The number is : $'
    EVEN_MSG  DB  'EVEN$', 0
    ODD_MSG   DB  'ODD$', 0

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX                   

     LEA DX, PROMPT_1             ; Load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a digit (from the user)
     INT 21H

     MOV BL, AL                   ; Save the digit in BL 

     LEA DX, PROMPT_2             ; Load and print PROMPT_2
     MOV AH, 9
     INT 21H

     TEST BL, 01H                 ; Check the least significant bit for even or odd
     JZ @EVEN                     ; If the least significant bit is 0 (even), jump to @EVEN

     ; If odd, print "ODD"
     LEA DX, ODD_MSG              ; Load ODD message
     MOV AH, 9
     INT 21H
     JMP @EXIT                    ; Jump to exit after printing ODD

     @EVEN:                        ; Label for even number
       LEA DX, EVEN_MSG            ; Load EVEN message
       MOV AH, 9
       INT 21H

     @EXIT:                       ; Exit label
     MOV AH, 4CH                  ; Return control to DOS
     INT 21H
   MAIN ENDP 

END MAIN
