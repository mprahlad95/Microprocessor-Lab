Data segment
        arr dB 12h,19h,4h,13h,17h,15h,18h,11h,21h,14h
data ends

code segment
assume cs:code,ds:data
start:
        MOV AX,DATA
        MOV DS,AX

        MOV CX,9
        UP:
        LEA SI,ARR
        MOV BX,CX
        UP2:INC DI
        MOV AL,[SI]
        CMP AL,[SI+1]
        JBE SKIP
        XCHG AL,[SI+1]
        MOV [SI],AL
        SKIP: 
        INC SI
        LOOP UP2
        MOV CX,BX
        LOOP UP
        INT 03

        MOV AH,4CH
        INT 21H
CODE ENDS 
END START
