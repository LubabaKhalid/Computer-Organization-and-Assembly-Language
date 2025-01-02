TITLE AL-006 : An AL Program to read three digits and compute their sum (displaying the result as a number)

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1  DB  'Enter the First digit : $'
    PROMPT_2  DB  'Enter the Second digit : $'
    PROMPT_4  DB  'Enter the third digit : $'
    PROMPT_3  DB  'Sum of First and Second digit : $'
    PROMPT_5  DB  'Sum of First, Second and Third digit : $'
    VALUE_1   DB  ?
    VALUE_2   DB  ?
    VALUE_3   DB  ?

.CODE
   MAIN PROC
     MOV AX, @DATA                ; Initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; Load and display the PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a character (First digit)
     INT 21H

     SUB AL, 30H                  ; Convert ASCII to Decimal
     MOV VALUE_1, AL

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, PROMPT_2             ; Load and display the PROMPT_2
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a character (Second digit)
     INT 21H

     SUB AL, 30H                  ; Convert to decimal
     MOV VALUE_2, AL

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, PROMPT_4             ; Load and display the PROMPT_4
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; Read a character (Third digit)
     INT 21H

     SUB AL, 30H                  ; Convert to decimal
     MOV VALUE_3, AL

     MOV AH, 2                    ; Carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; Line feed
     INT 21H

     LEA DX, PROMPT_3             ; Load and display the PROMPT_3
     MOV AH, 9
     INT 21H

     MOV AL, VALUE_1              ; Load first digit into AL
     ADD AL, VALUE_2              ; Add second digit to AL

     LEA DX, PROMPT_5             ; Load and display the PROMPT_5
     MOV AH, 9
     INT 21H

     ADD AL, VALUE_3              ; Add third digit to AL

     ; Now, AL contains the sum of the three digits
     ; We will display the sum as a number

     ADD AL, 30H                  ; Convert sum to ASCII (if it's a single digit sum)
     MOV DL, AL
     MOV AH, 2
     INT 21H

     MOV AH, 4CH                  ; Return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
