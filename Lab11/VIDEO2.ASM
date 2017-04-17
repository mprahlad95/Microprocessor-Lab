DATA SEGMENT
        MSG DB 'HELLO'
        COL DB 40H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,03
        INT 10H

        MOV DL,00
        LEA DI,MSG
        MOV CH,0
        MOV CL,COL
        UP:     MOV DH,[DI]
                PUSH DS
                MOV AX,0B800H
                MOV DS,AX
                MOV BL,12
                MOV AL,160
                MUL BL
                MOV SI,AX
                MOV AH,00
                MOV AL,02
                MUL CL
                ADD SI,AX
                MOV [SI],DH
                MOV BYTE PTR[SI+1],47
                INC DI
                INC CL
                POP DS
		INC DL
                CMP DL,05
                JNZ UP
                MOV AH,4CH
                INT 21H
CODE ENDS
END START
