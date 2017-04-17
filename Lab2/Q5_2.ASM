;Block transfer when overlapping

DATA SEGMENT
        ARRAY1 DB 11H, 22H, 33H, 44H, 55H     ;[00],[01],[02],[03],[04]
        ARRAY2 DB 2 DUP(?)                    ;[05],[06]
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 04H

        MOV CX, 05H
BACK:   MOV AL, ARRAY1[SI]
        MOV ARRAY2[SI+02H], AL
        DEC SI
LOOP BACK

        MOV AH, 4CH
        INT 21H

CODE ENDS
END START
