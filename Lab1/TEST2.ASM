;ADDING TWO NUMBERS WITH CARRY

DATA SEGMENT
        NUM1 DB 0EEH   
        NUM2 DB 0DDH   
        CARRY DB 00H   
        SUM DB ?       
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL,NUM1
        ADD AL,NUM2
        MOV SUM,AL
        ADC CARRY,00H

        INT 21H
CODE ENDS
END START
