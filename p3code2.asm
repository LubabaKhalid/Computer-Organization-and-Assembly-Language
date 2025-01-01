TITLE AL-032 : An AL Program to read a letter in UPPER and print it   
              ; after converting it in to LOWER case letter ( using OR Logic
              ; instruction ).
 
 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the UPPER Case Letter : $'
    PROMPT_2  DB  0DH,0AH,'The lower Case Letter is : $'    ; NOW CONVERT TO LOWER

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a letter
     INT 21H

     MOV BL, AL                   ; save the letter in BL 

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     OR BL, 20H                   ; convert a lower case letter to upper
                                  ; case letter

     MOV AH, 2                    ; print the upper case letter
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN