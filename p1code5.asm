TITLE AL-005 : An AL Program to read two digits such that second digit is
              ; less than the first digit, computes and displays their
              ; sum (without using variables).

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1  DB  "Enter the First digit : $"
    PROMPT_2  DB  "Enter the Second digit : $"
    PROMPT_3  DB  "Sum of First and Second digit : $"

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; Load and display the PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a character (First digit)
     INT 21H

     MOV BL, AL                   ; Save First digit in BL (ASCII code)
     SUB BL, 30H                  ; Convert to decimal

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, PROMPT_2             ; Load and display the PROMPT_2
     MOV AH, 9
     INT 21H

     MOV DL, 0AH                  ; Line feed again for better readability
     INT 21H

     MOV AH, 1                    ; Read a character (Second digit)
     INT 21H

     MOV BH, AL                   ; Save Second digit in BH (ASCII code)
     SUB BH, 30H                  ; Convert to decimal

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H
     
     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, PROMPT_3             ; Load and display the PROMPT_3
     MOV AH, 9
     INT 21H

     ; Now add the two digits
     ADD BL, BH                   ; Add First digit (BL) and Second digit (BH)

     ADD BL, 30H                  ; Convert sum to ASCII code

     MOV AH, 2                    ; Display the sum (as a character)
     MOV DL, BL
     INT 21H
     
     MOV AH, 4CH                  ; Return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
