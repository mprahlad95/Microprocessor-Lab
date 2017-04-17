DATA SEGMENT
        NUM1 DB 7BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
        START:

                MOV AX, DATA    ;   Syncing
                MOV DS, AX      ;  .........

                MOV AL,0FFH
                MOV BH,NUM1
                IMUL NUM1
                MOV AH, 4CH
                INT 21H
        CODE ENDS        
END START


                     ;MULTIPLICATION OF SIGNED BYTES
