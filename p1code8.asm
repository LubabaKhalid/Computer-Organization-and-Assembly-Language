TITLE AL-008 : An AL Program to read a letter in lower case and print it
              ; after converting it in to Upper case.    

              ;  Now read the letter in Upper Case and convert it into lower case

 .MODEL SMALL 
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the Upper Case Letter : $'
    PROMPT_2  DB  'The lower Case Letter is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a letter   in upper case
     INT 21H

     MOV BL, AL                   ; save the letter in BL 
     
     MOV AH, 2                    ; return carriage 
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

    ; SUB BL, 20H   
    ADD BL, 20H                ; convert a upper case letter to lower case letter

     MOV AH, 2                    ; print the lower case letter
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN