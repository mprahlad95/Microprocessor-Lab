CODE SEGMENT
ASSUME CS:CODE
        START:
                MOV AX,12F7H
                MOV BX,22F9H
                MUL BX
                MOV AH, 4CH
                INT 21H
        CODE ENDS        
END START
