DATA SEGMENT
        ARRAY DW 1001H, 1202H, 1303H, 1404H, 1505H, 1606H, 1707H, 1808H, 1909H, 1010H
        KEY DW 1707H
        FLAG DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H

        MOV CX, 0AH
        BACK:   MOV AX, WORD PTR KEY
                MOV BX, WORD PTR ARRAY[SI]
                CMP AX, BX
                JE FOUND
                INC SI
                INC SI
                MOV FLAG, 00H
        LOOP BACK

        FOUND:  MOV BX, 1111H
                MOV FLAG, 01H

                MOV AH, 4CH
                INT 21H
CODE ENDS
END START
