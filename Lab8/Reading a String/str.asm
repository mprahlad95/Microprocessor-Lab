DATA SEGMENT
        STRING DB 'THIS IS A STRING$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX
        LEA DX,STRING
        MOV AH,09
        INT 21H
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
