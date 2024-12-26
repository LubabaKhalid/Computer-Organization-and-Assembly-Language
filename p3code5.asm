TITLE AL-035 : An AL Program that divide the contents of AL by 4 ( using          now divide  by 2
              ; SHR instruction ).
 
 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Original value of AL : $'
    PROMPT_2  DB  0DH,0AH,'Processed value of AL : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AL, 32H                  ; place 8 in the AL         now 2
     MOV BL, AL                   ; save Al in to BL    

     MOV AH, 2                    ; print the original value of AL
     MOV DL, AL
     INT 21H

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     AND BL, 0FH                  ; convert ascii to decimal code

     MOV CL, 1                   ; divide AL by 4
     SHR BL, CL

     OR BL, 30H                   ; convert decimal to ascii code

     MOV AH, 2                    ; print the processed value of AL
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN