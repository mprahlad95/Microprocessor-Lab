;CONVERT 2-DIGIT BCD TO HEX

DATA SEGMENT
        BDC DB 23H      ;REPRESENTING 23 BCD USING HEX -- 0010 0011
        HEX DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
       MOV AX, DATA
       MOV DS, AX

       MOV AL, BCD
       MOV BL, 0AH
       MOV CL, 4

       SHR AL, CL
       MUL BL
       MOV CL, BCD
       AND CL, OFH
       ADD AL, CL
       MOV HEX, AL

       MOV AH, 4CH
       INT 21H
CODE ENDS
END START

