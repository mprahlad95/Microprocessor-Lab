DATA SEGMENT
        NUM1 DD 11223344H
        NUM2 DD 99886677H
        SUM DD ?
        CARRY DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H

        MOV AX, WORD PTR NUM1[SI]
        ADD AX, WORD PTR NUM2[SI]
        MOV WORD PTR SUM[SI], AX

        INC SI
        INC SI

        MOV AX, WORD PTR NUM1[SI]
        ADD AX, WORD PTR NUM2[SI]
        MOV WORD PTR SUM[SI], AX
CODE ENDS
END START

        
