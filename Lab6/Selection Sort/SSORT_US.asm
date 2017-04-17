data segment
        ARRAY dB 10H,12H,14H,16H,18H,11H,13H,15H,17H,19H
data ends

code segment
assume cs:code,ds:data
start:
        MOV AX, data
        MOV DS,AX

        MOV AX,0H
        LEA SI,ARRAY
        MOV CX,9H

        UP2:    MOV BX,CX
                MOV DI,SI
                UP1:    INC DI
                        MOV AL,[SI]
                        CMP AL,[DI]
                        JBE skip
                                XCHG AL,[DI]
                                MOV [SI],AL
                        skip:
                        DEC BX
                        JNZ UP1
                INC SI
                LOOP UP2

       MOV AH,4CH
       INT 21H
code ends
end start
