data segment
num1 db 33h
num2 db 21h
lcm dw ?
data ends
code segment
assume cs:code,ds:data
start:
	MOV AX,DATA
	MOV DS,AX
	MOV AX,0H
	MOV AL,NUM1
	MOV BL,NUM2
	CALL LCMF
        INT 3
	MOV AH,4CH
	INT 21H
LCMF PROC
UP:     PUSH AX
        DIV BL
	CMP AH,0H
	JE EXIT
        POP AX
        ADD AL,NUM1
	ADC AH,0H
	JMP UP
EXIT:   POP LCM
RET
CODE ENDS
END START
