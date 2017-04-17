DATA SEGMENT
        NUM1 DW 0FF7BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
        START:

                MOV AX, DATA    ;   Syncing
                MOV DS, AX      ;  .........

                MOV AX,99FFH
                MOV BX,NUM1
                IMUL NUM1
                MOV AH, 4CH
                INT 21H
        CODE ENDS        
END START


                     ;MULTIPLICATION OF SIGNED WORDS
