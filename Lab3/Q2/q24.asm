DATA SEGMENT
        NUM1 DW 0CC7BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
        START:

                MOV AX, DATA    ;   Syncing
                MOV DS, AX      ;  .........

                MOV AX, 99FFH	;The word is "F123 99FF"
		MOV DX, 0F123H	;

                MOV BX,NUM1
                IDIV NUM1

        CODE ENDS
END START


                     ;DIVIDE 32-BIT BY 16-BIT SIGNED
