CODE SEGMENT
ASSUME CS:CODE
START:
        MOV AH,0              ;CLEARING AH
        MOV AL,03             ;CLEARS THE SCREEN AND ENTERS MODE 3
        INT 10H               ;FOR COLOR DISPLAY

        MOV AH,06             ;07 FOR SCROLL DOWN, 06 FOR SCROLL UP
        mov al,10

        MOV BH,01001000B      ;---BL RGB T RGB--- ATTRIBUTE
                       
        MOV CH,00             ;FOR R1
        MOV CL,00             ;FOR C1
        MOV DH,18H            ;FOR R2
        MOV DH,4FH            ;FOR C2
        INT 10H
;        INT 21H

        MOV BH,00101000B      ;---BL RGB T RGB--- ATTRIBUTE

        MOV CH,02H            ;FOR R1
        MOV CL,02H            ;FOR C1
        MOV DH,16H            ;FOR R2
        MOV DH,4DH            ;FOR C2
        INT 10H
 ;       INT 21H

        MOV BH,00011000B      ;---BL RGB T RGB--- ATTRIBUTE
                        
        MOV CH,04H            ;FOR R1
        MOV CL,04H            ;FOR C1
        MOV DH,14H            ;FOR R2
        MOV DH,4BH            ;FOR C2
        INT 10H
        INT 21H

        INT 10H
        MOV AL,4CH            ;TERMINATE
        INT 21H

CODE ENDS
END START
