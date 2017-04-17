;PROGRAM TO FIND GREATEST AND SMALLEST IN AN ARRAY

DATA SEGMENT
        ARRAY DB 11H,12H,13H,15H,19H,21H,22H,31H,23H,66H
        GREATEST DB ?
        SMALLEST DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H
        MOV AH, ARRAY[SI]
        MOV CX, 0AH
        FINDGREATEST:   MOV AL, ARRAY[SI]
                        CMP AH, AL
                        JG SKIP1
                        MOV AH, ARRAY[SI]
                        SKIP1:
                        INC SI
        LOOP FINDGREATEST
        MOV GREATEST, AH

        MOV SI, 00H
        MOV AH, ARRAY[SI]
        MOV CX, 0AH
        FINDSMALLEST:   MOV AL, ARRAY[SI]
                        CMP AH, AL
                        JS SKIP2
                        MOV AH, ARRAY[SI]
                        SKIP2:
                        INC SI
        LOOP FINDSMALLEST
        MOV SMALLEST, AH

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
