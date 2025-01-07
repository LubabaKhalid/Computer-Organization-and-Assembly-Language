.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'Enter the character : $'                  ; Prompt message
    MSG_1   DB  'The input letter is : $'                   ; Message for valid input (lowercase letter)
    MSG_2   DB  'The input character is not a Lower Case Letter.$' ; Message for invalid input

.CODE
MAIN PROC
    MOV AX, @DATA            ; Initialize DS with data segment address
    MOV DS, AX

    LEA DX, PROMPT           ; Load the address of the prompt string into DX
    MOV AH, 9
    INT 21H                  ; Display the prompt message

    MOV AH, 1                ; Read a character from the user
    INT 21H                  ; Input is stored in AL

    MOV BL, AL               ; Save the input character into BL for comparison

    MOV AH, 2                ; Print a carriage return (CR) for formatting
    MOV DL, 0DH
    INT 21H

    MOV DL, 0AH              ; Print a line feed (LF)
    INT 21H

    CMP BL, 'a'              ; Compare input character with 'a'
    JB @DISPLAY              ; Jump to @DISPLAY if input < 'a' (invalid, not lowercase)

    CMP BL, 'z'              ; Compare input character with 'z'
    JA @DISPLAY              ; Jump to @DISPLAY if input > 'z' (invalid, not lowercase)

    LEA DX, MSG_1            ; Load the address of the valid message (MSG_1)
    MOV AH, 9
    INT 21H                  ; Display the valid input message

    MOV AH, 2                ; Print the input character
    MOV DL, BL
    INT 21H

    JMP @EXIT                ; Jump to @EXIT to end the program

@DISPLAY:                    ; Label for invalid input (not lowercase)
    LEA DX, MSG_2            ; Load the address of the invalid message (MSG_2)
    MOV AH, 9
    INT 21H                  ; Display the invalid input message

@EXIT:                       ; Label for exiting the program
    MOV AH, 4CH              ; Return control to DOS (terminate the program)
    INT 21H
MAIN ENDP
END MAIN