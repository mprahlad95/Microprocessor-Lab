DATA SEGMENT 
        BDC DB ?
        HEX DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
       MOV AX, DATA
       MOV DS, AX

       mov al,bcd
       mov bl,0ah
       mov cl,4

       shr al,cl
       mul bl
       mov cl,bcd
       and cl,0fh
       add al,cl
       mov hex,al

       mov ah,4ch
       int 21h
    code ends
    end start

