ORG 100h
; Two-digit number to be displayed 
MOV AL, 90    ; Load the two-digit number into AL
; Split the number into tens and units
MOV BL, 10        ; Set divisor to 10 to separate tens and units
DIV BL            ; Divide AL by 10, AL = quotient (tens), AH = remainder (units)
; Store the quotient (tens) and remainder (units)
MOV BH, AL        ; Store the tens digit in BH
MOV BL, AH        ; Store the units digit in BL
MOV DX, OFFSET msg_1 
MOV AH, 09h       
INT 21h  
; Convert tens digit to ASCII
ADD BH, '0'       ; Convert the tens digit to ASCII
MOV DL, BH        ; Move the ASCII tens digit to DL for printing
MOV AH, 02h       ; DOS interrupt to print a character
INT 21h           ; Print the tens digit
; Convert units digit to ASCII
ADD BL, '0'       ; Convert the units digit to ASCII
MOV DL, BL        ; Move the ASCII units digit to DL for printing
MOV AH, 02h       ; DOS interrupt to print a character
INT 21h           ; Print the units digit
; Terminate the program
MOV AH, 4Ch       ; DOS interrupt to exit the program
INT 21h
msg_1  DB 'The two digit no is : $'
END
