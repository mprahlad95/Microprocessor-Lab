DATA SEGMENT
        NUM1 DW?
        NUM2 DW?
        NUM3 DW?
        NUM4 DW?
        GCD DW?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX
        MOV AX,NUM1
        MOV BX,NUM2
        CALL FIND_GCD
        MOV AX,GCD
        MOV BX,NUM3
        CALL FIND_GCD
        MOV AX,GCD
        MOV,BX,NUM4
        CALL FIND_GCD
        MOV AH,4CH
        INT 21H
        FIND_GCD PROC
                CMP AX,BX
                JZ EXIT
                JC BGA
                SUB AX,BX
                JMP FIND_GCD
                BGA:SUB BX,AX
                JMP FIND_GCD
                EXIT: MOV GCD,AX
                RET
                FIND_GCD ENDP
                CODE ENDS
                END START

