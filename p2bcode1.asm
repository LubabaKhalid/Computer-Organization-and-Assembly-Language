.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'Enter the character : $'
    MSG_1   DB  'The input letter is : $'
    MSG_2   DB  'The input character is not "y" or "Y".$'

.CODE
MAIN PROC
    MOV AX, @DATA            ; Initialize DS
    MOV DS, AX

    LEA DX, PROMPT           ; Load address of PROMPT
    MOV AH, 9
    INT 21H                  ; Display prompt

    MOV AH, 1                ; Read a character from user
    INT 21H                  ; Store input in AL

    MOV BL, AL               ; Save the input character into BL

    MOV AH, 2                ; Carriage return (CR)
    MOV DL, 0DH
    INT 21H

    MOV DL, 0AH              ; Line feed (LF)
    INT 21H

    CMP BL, 'y'              ; Compare input character and 'y'
    JE @DISPLAY              ; Jump to @DISPLAY if input is 'y'

    CMP BL, 'Y'              ; Compare input character and 'Y'
    JE @DISPLAY              ; Jump to @DISPLAY if input is 'Y'

    LEA DX, MSG_2            ; Load address of MSG_2 (error message)
    MOV AH, 9
    INT 21H                  ; Display error message

    JMP @EXIT                ; Exit the program

@DISPLAY:                    ; Label to display the character if input is 'y' or 'Y'
    LEA DX, MSG_1            ; Load address of MSG_1 (success message)
    MOV AH, 9
    INT 21H                  ; Display success message

    MOV AH, 2                ; Print the input character
    MOV DL, BL
    INT 21H

@EXIT:                       ; Exit the program
    MOV AH, 4CH              ; Return control to DOS
    INT 21H
MAIN ENDP
END MAIN