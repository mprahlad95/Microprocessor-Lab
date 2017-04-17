DATA SEGMENT
        NUM1 DW 9BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
        START:

                MOV AX, DATA    ;   Syncing
                MOV DS, AX      ;  .........

                MOV AX, 99FFH

                MOV BX,NUM1
                IDIV NUM1

        CODE ENDS
END START


                     ;DIVIDE 16-BIT BY 8-BIT SIGNED
