DATA SEGMENT
        NUM1 DQ 6901334455667788H
        NUM2 DQ 9988776655443322H
        SUM DQ ?
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
        ADC AX, WORD PTR NUM2[SI]
        MOV WORD PTR SUM[SI], AX

        INC SI
        INC SI

        MOV AX, WORD PTR NUM1[SI]
        ADC AX, WORD PTR NUM2[SI]
        MOV WORD PTR SUM[SI], AX

        INC SI
        INC SI

        MOV AX, WORD PTR NUM1[SI]
        ADC AX, WORD PTR NUM2[SI]
        MOV WORD PTR SUM[SI], AX
        
CODE ENDS
END START
