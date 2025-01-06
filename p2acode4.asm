
TITLE AL-014 : An AL Program to print the first 100 ASCII Characters

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT  DB  'The first 100 ASCII Characters are : $'

.CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 100                  ; initialize CX for the loop (100 iterations)
     
     MOV AH, 2                     ; set output function for printing a character
     MOV DL, 32                    ; start with the ASCII value of space (32)

     @LOOP:                        ; loop label
       INT 21H                     ; print ASCII character in DL

       INC DL                      ; increment DL to next ASCII character
       DEC CX                      ; decrement loop counter (CX)
       JNZ @LOOP                   ; repeat if CX is not zero

     MOV AH, 4CH                   ; return control to DOS
     INT 21H
   MAIN ENDP
END MAIN
