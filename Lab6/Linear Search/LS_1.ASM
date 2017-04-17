DATA SEGMENT
        ARRAY DB 01H, 02H, 03H, 04H, 05H, 06H, 07H, 09H, 10H
        KEY DB 07H
        FLAG DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H

        MOV CX, 0AH
        BACK:   MOV AL, KEY
                MOV AH, ARRAY[SI]
                CMP AH, AL
                JE FOUND
                INC SI
                MOV FLAG, 00H
        LOOP BACK

        FOUND:  MOV BX, 1111H
                MOV FLAG, 01H
                MOV AH, 4CH
                INT 21H
CODE ENDS
END START
