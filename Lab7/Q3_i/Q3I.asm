DATA SEGMENT
        BCD DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
                
        CALL ACCEPT_HEX         ;STORES A 2-DIGIT HEX IN BL
        CALL SHOW_DEC           ;DISPLAYS DECIMAL EQUIVALENT OF HEX IN BL
        
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

SHOW_DEC PROC
        MOV AL,BL		;ASSUMING THAT WE HAVE THE HEX NUMBER IN BL
        MOV AH,0

        mov bl,0ah
        div bl			;DIVIDING AX BY BL

        mov bh,ah
        mov ah,0
        div bl
        mov BCD+1,al
        mov cl,04
        shl ah,cl
        add ah,bh
        mov BCD,ah
        MOV DL,BCD

        MOV AH,02
        INT 21H
RET
SHOW_DEC ENDP

CODE ENDS
END START
