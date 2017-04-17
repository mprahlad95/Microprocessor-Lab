CODE SEGMENT
ASSUME CS:CODE
        START:
                MOV CX,05H
                BACK:
                  ADC AX, 9999H
                  XCHG AH,AL
                  DAA
                  XCHG AH,AL
                  DAA
                LOOP BACK

                MOV DX,AX
        CODE ENDS
        END START
                       
