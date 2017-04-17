DATA SEGMENT
        NUM1 DB ?
        NUM2 DB ?
        SUM DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX
                
        CALL ACCEPT_HEX
        MOV NUM1,BL

        CALL ACCEPT_HEX
        MOV NUM2,BL

        MOV AL,NUM1
        ADC AL,NUM2
        MOV SUM,AL

        MOV BL,SUM      ;VALUE OF BL WILL BE PASSED TO DL AND PRINTED
        CALL SHOW_HEX

        MOV AH,4CH
        INT 21H

ACCEPT_HEX PROC
        MOV AH,01       ;Accept a number from 
        INT 21H         ;the keyboard...

        SUB AL,30H
        CMP AL,0AH
        JC DOWN

        SUB AL,07H

        DOWN:   MOV CL,04
                SHL AL,CL
                MOV BL,AL

                MOV AH,01
                INT 21H
                SUB AL,30H
                CMP AL,0AH
                JC DOWN1
                SUB AL,07H
        DOWN1: ADD BL,AL          ;BY THIS TIME, WE HAVE A HEX NUMBER
                                  ;STORED IN BL
RET
ACCEPT_HEX ENDP

SHOW_HEX PROC           ;SHALL PRINT BL ON CONSOLE

        MOV DL,BL

        MOV CL,4        ;
        SHR DL,CL       ;SHIFTING MOST SIGNIFICANT NIBBLE TO RIGHT 

        CMP DL,0AH
        JL ADDTHIRTY_I                ;IF THE NIBBLE IS LESS THEN 0AH THEN ADD 30H
        ADD DL,07H                    ;OR JUST ADD 37H
        ADDTHIRTY_I:
                ADD DL,30H

        MOV BH,DL                     ;MOVE THE CHANGED VALUE TO BH

        MOV AH,02                     ;
        INT 21H                       ;PRINT DL ON CONSOLE

        MOV DL,BL                     ;AGAIN MOVE BL TO DL
        AND DL,0FH                    ;AND MOST SIGNIFICANT NIBBLE WITH 0
                                      ;SO THAT LEAST ONE IS ONLY LEFT
        CMP DL,0AH                    ;COMPARE LSN WITH 0AH AND REPEAT STEPS ABOVE
        JL ADDTHIRTY_II
        ADD DL,07H

        ADDTHIRTY_II:
                ADD DL,30H

        MOV AH,02                     ;PRINT DL ON CONSOLE
        INT 21H

RET
SHOW_HEX ENDP


CODE ENDS
END START
