.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'The Lower Case Letters from a to z are : $'

.CODE
MAIN PROC
    MOV AX, @DATA                ; Initialize DS
    MOV DS, AX

    LEA DX, PROMPT               ; Load address of PROMPT into DX
    MOV AH, 9
    INT 21H                      ; Print the prompt message

    MOV CX, 26                   ; Initialize CX to 26 (number of letters)
    
    MOV AH, 2                    ; Set output function (to print a character)
    MOV DL, 61H                  ; Set DL to 'a' (ASCII 61H)

@DO_WHILE_LOOP:                  ; Start of loop
    INT 21H                      ; Print character in DL

    INC DL                       ; Increment DL to next character ('a' -> 'b', etc.)
    DEC CX                       ; Decrement CX (loop counter)
    JNZ @DO_WHILE_LOOP           ; If CX != 0, jump back to @DO_WHILE_LOOP

    MOV AH, 4