TITLE AL-019 : An AL Program that reads a two characters, compare them and
              ; prints the smallest character ( Simulation of If-Else       now print the larger one
              ; structure ).

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the First character : $'
    PROMPT_2  DB  'Enter the Second character : $'
    PROMPT_3  DB  'The largest character is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a character
     INT 21H

     MOV BL, AL                   ; save the input character into BL

     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a character
     INT 21H

     MOV BH, AL                   ; save the input character into BH

     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H

     LEA DX, PROMPT_3             ; load and print PROMPT_3
     MOV AH, 9
     INT 21H

     CMP BL, BH                   ; compare the BL and BH

     JNBE @ELSE                   ; jump to label @ELSE if BL>BH

     MOV DL, BH                   ; move first character into DL
     JMP @DISPLAY                 ; jump to label @DISPLAY

     @ELSE:                       ; jump label
       MOV DL, BL                 ; move second character into DL

     @DISPLAY:                    ; jump label
       MOV AH, 2                  ; print the character
       INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN

 ;**************************;
 ;**************************;
 ;------------------------------  THE END  ---------------------------------;
 ;**************************;
 ;**************************;