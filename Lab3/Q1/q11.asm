CODE SEGMENT
ASSUME CS:CODE
        START:
                MOV AL,07H
                MOV BH,0F9H
                MUL BX
                MOV AH, 4CH
                INT 21H
        CODE ENDS        
END START
