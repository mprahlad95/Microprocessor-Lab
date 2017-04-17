;ADDITION OF THREE 16-BIT NUMBERS

DATA SEGMENT
        NUM1 DW 0FFEEH   
        NUM2 DW 0FFDDH
        NUM3 DW 0FFCCH
        CARRY DB 00H
        SUM DW ?       
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV BX,NUM1
        MOV CX,NUM2
        MOV DX,NUM3
        ADD SUM,BX
        ADD SUM,CX
        ADC CARRY,00H
        ADD SUM,DX
        ADC CARRY,00H
        INT 21H
CODE ENDS
END START
