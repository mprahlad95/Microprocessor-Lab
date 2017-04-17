;Block transfer using LODSB and STOSB/ MOVSB

DATA SEGMENT
        STR1 DB 'KASHISH GROVER'
        NEW_LOC DB 14 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV ES,AX
        LEA SI,STR1
        LEA DI,NEW_LOC

        MOV CX,14
        REP MOVSB

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
