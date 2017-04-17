DATA SEGMENT
        A DB 'ENTER A PASSWORD - $'
        B DB 8 DUP('$')
        C DB '*$'
        D DB '1234567'

        VA DB 'VALID$'
        INV DB 'INVALID$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        LEA DX,A        ;LOADING MESSAGE A ONTO DX
        LEA SI,B        ;OFFSET B
        MOV AH,09       ;TO DISPLAY WHAT IS PRESENT IN DX, WE USE O9 INTERRUPT
        INT 21H

        MOV CX,07
BACK:   MOV AH,08
        INT 21H
        MOV [SI],AL
        INC SI
        MOV DX, OFFSET C
        MOV AH,09
        INT 21H
LOOP BACK

NEQUAL: LEA DX,INV
        JMP EXIT1

MOV CX,07
BACK2:
        LEA DX,VA
        LEA SI,C                ;LOAD PASSWORD ENTERED
        LEA DI,D                ;LOAD PASSWORD EXPECTED
        MOV AX,[SI]
        MOV BX,[DI]
        INC SI
        INC DI
        CMP AX,BX               ;COMPARE THE VALUES AT BYTE LEVEL
        JNE NEQUAL              ;IF NOT EQUAL
LOOP BACK2 

MOV AH,09
INT 21H

MOV AH,4CH
INT 21H

CODE ENDS
END START
