data segment

        value dW 1000H, 2000H
        gcd dW ?

data ends

code segment
        assume cs: code, ds:data
        start:
                MOV AX, data
                MOV DS, AX

                MOV SI, 0
                MOV AX, WORD PTR VALUE [SI]
                MOV BX, WORD PTR VALUE [SI+2]

         HCF:   CMP AX, BX
                JZ EXIT
                JC BGA
                SUB AX, BX
                JMP HCF

         BGA:   SUB BX, AX
                JMP HCF

        EXIT:   MOV GCD, AX

                MOV AH, 4CH
                INT 21H

code ends
end start