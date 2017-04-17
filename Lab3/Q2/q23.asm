DATA SEGMENT
        NUM1 DW 0FF7BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
        START:

                MOV AX, DATA    ;   Syncing
                MOV DS, AX      ;  .........

                MOV AX, 99FFH	;The word is "F123 99FF"
		MOV DX, 0F123H	;

                MOV BX,NUM1
                DIV NUM1
                MOV AH, 4CH
                INT 21H
        CODE ENDS        
END START


                     ;DIVIDE 32-BIT BY 16-BIT UNSIGNED