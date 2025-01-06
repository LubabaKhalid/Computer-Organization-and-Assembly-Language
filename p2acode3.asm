TITLE AL-013 : An AL Program to
              ; (a) display "!",             
              ; (b) read three initials,
              ; (c) display them in the middle of an 8x8 box of hashtags,
              ; (d) beep the computer.

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT     DB  0DH,0AH,'Enter three initials : $'
    hastags    DB  '########', 0DH,0AH, '$' ; First row of hashtags
    NEXT_LINE  DB  0DH,0AH,"$"               ; Next line string
    BOX_ROW2   DB  '########', 0DH,0AH, '$' ; Second row of hashtags, empty initially

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     ; Display "!"
     MOV AH, 2                    
     MOV DL, "!"                   ; Load the character '!' into DL
     INT 21H                        ; Display '!'

     ; Prompt user to enter initials
     LEA DX, PROMPT               ; Load and display the string PROMPT
     MOV AH, 9
     INT 21H

     ; Read first initial
     MOV AH, 1                    
     INT 21H
     MOV BL, AL                   ; Save first initial in BL

     ; Read second initial
     INT 21H                      
     MOV BH, AL                   ; Save second initial in BH

     ; Read third initial
     INT 21H                      
     MOV CL, AL                   ; Save third initial in CL

     ; Move to next line
     LEA DX, NEXT_LINE            
     MOV AH, 9
     INT 21H
     
     ; Display the first row of hashtags
     LEA DX, hastags              ; Load the string hastags
     MOV AH, 9
     INT 21H

     ; Modify the second row of hashtags with initials
     LEA DX, BOX_ROW2
     MOV hastags+4, BL            ; Place first initial in position 4
     MOV hastags+5, BH            ; Place second initial in position 5
     MOV hastags+6, CL            ; Place third initial in position 6

     ; Display the second row (with initials)
     MOV AH, 9
     INT 21H

     ; Return the second row back to original state
     MOV hastags+4, '#'           ; Reset the positions
     MOV hastags+5, '#'
     MOV hastags+6, '#'

     ; Display the first row of hashtags again (repeated)
     LEA DX, hastags
     MOV AH, 9
     INT 21H

     ; Beep the computer
     MOV AH, 2                    
     MOV DL, 7H                   ; ASCII value for beep sound
     INT 21H

     ; Return control to DOS
     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
END MAIN
