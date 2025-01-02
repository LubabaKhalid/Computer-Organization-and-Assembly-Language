TITLE AL-011 : An AL Program to read one of the hex digits A-F, and display 
              ; it on the next line in decimal.
              ; Now the program also converts the decimal to its ASCII value..

.MODEL SMALL
.STACK 100H

.DATA
    MSG_1 DB 'Enter the Hex digit (A-F): $'
    MSG_2 DB 0DH, 0AH, 'The corresponding Decimal digit is: $'
    MSG_3 DB 0DH, 0AH, 'The corresponding ASCII value is: $'

.CODE
  MAIN PROC
      ; Initialize Data Segment
      MOV AX, @DATA
      MOV DS, AX

      ; Display MSG_1 (Prompt user)
      LEA DX, MSG_1
      MOV AH, 9
      INT 21H

      ; Read hex digit (A-F)
      MOV AH, 1
      INT 21H
      MOV BL, AL                   ; Save input to BL

      ; Convert hex (A-F) to decimal (10-15)
      CMP AL, 'A'
      JL  Not_A_to_F               ; If it's less than 'A', no conversion needed
      SUB AL, 'A'                  ; Convert 'A' -> 0, 'B' -> 1, ..., 'F' -> 5
      ADD AL, 10                   ; Add 10 to get the decimal value

      MOV CL, AL                   ; Save decimal value to CL

Not_A_to_F:
      ; Display MSG_2 (Decimal)
      LEA DX, MSG_2
      MOV AH, 9
      INT 21H

      ; Print decimal value
      ADD CL, '0'                  ; Convert decimal to ASCII
      MOV DL, CL
      MOV AH, 2
      INT 21H

      ; Display MSG_3 (ASCII Value)
      LEA DX, MSG_3
      MOV AH, 9
      INT 21H

      ; Print the original ASCII value of hex digit
      MOV DL, BL                   ; ASCII value is the input itself
      MOV AH, 2
      INT 21H

    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
