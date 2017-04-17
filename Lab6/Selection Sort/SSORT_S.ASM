Data segment
        arr dB 12h,19h,4h,13h,17h,15h,18h,11h,21h,14h
data ends

code segment
assume cs:code,ds:data
start:
        MOV AX,DATA
        MOV DS,AX

        LEA SI,ARR
        MOV CX,09H
        UP:     MOV BX,CX
                MOV DI,SI
        UP2:    INC DI
                MOV AL,[SI]
                CMP AL,[DI]
                JBE SKIP
                        XCHG AL,[DI]
                        MOV [SI],AL
                SKIP:
                DEC BX
                JNZ UP2
                INC SI
        LOOP UP

        MOV AH,4CH
        INT 21H 
CODE ENDS 
END START
