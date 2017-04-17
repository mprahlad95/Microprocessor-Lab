CODE SEGMENT
ASSUME CS:CODE
START:
        MOV BL, 6FH

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
        AND DL,0FH                    ;ANDS F WITH MSN
                                      ;SO THAT LEAST ONE IS ONLY LEFT
        CMP DL,0AH                    ;COMPARE LSN WITH 0AH AND REPEAT STEPS ABOVE
        JL ADDTHIRTY_II
        ADD DL,07H

        ADDTHIRTY_II:
                ADD DL,30H

        MOV AH,02                     ;PRINT DL ON CONSOLE
        INT 21H

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
