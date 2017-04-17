dispstring macro str
        lea dx, str
        mov ah, 09
        int 21h
endm
                  
acceptchoice macro x
        mov ah,01       ;accept a byte from the keyboard
        int 21h
        mov x,al
endm

addnums macro num1,num2,res
        mov ah,num1
        mov bh,num2
        add ah,bh
        daa
        mov res,ah
endm

subnums macro num1,num2,res
        mov ah,num1
        mov bh,num2
        sub ah,bh
        mov res,ah
endm

mulnums macro num1,num2,res
        mov ah,num1
        mov bh,num2
        mov res,00h
        mov res,ax
endm

divnums macro num1,num2,res
        mov ah,num1
        mov bh,num2
        mov res,00h
        mov res,ax
endm

disp macro res
        mov dl,res      ;printing dl on console
        mov ah,02
        int 21h
endm


data segment
        num1msg db 'Enter number 1 - $'
        num2msg db 'Enter number 2 - $'

        nextline db 10,13,'$'

        addmsg db '1. Add$'
        submsg db '2. Subtract$'
        mulmsg db '3. Multiply$'
        divmsg db '4. Divide$'

        choicemsg db 'Enter choice - $'

        resmsg db 'Result - $'

        invmsg db 'Invalid choice!$'

        num1 db ?
        num2 db ?
        choice db ?
        result db ?

data ends


code segment
assume cs:code, ds:data
start:
        mov ax, data
        mov ds, ax

        dispstring num1msg
                call accepthex
                mov num1,bl
        dispstring nextline

        dispstring num2msg
                call accepthex
                mov num2,bl
        dispstring nextline
        dispstring nextline

        dispstring addmsg
        dispstring nextline

        dispstring submsg
        dispstring nextline

        dispstring mulmsg
        dispstring nextline

        dispstring divmsg
        dispstring nextline
        dispstring nextline

        dispstring choicemsg
                acceptchoice choice
        dispstring nextline

                cmp choice,31h
                je addition
                cmp choice,32h
                je subtraction
                cmp choice,33h
                je multiplication
                cmp choice,34h
                je division
                jmp invalid

addition:               addnums num1,num2,result
                        jmp final

subtraction:            subnums num1,num2,result
                        jmp final

multiplication:         mulnums num1,num2,result
                        jmp final

division:               divnums num1,num2,result
                        jmp final

invalid:                dispstring invmsg
                        jmp exit

final:  dispstring resmsg
        disp result
        dispstring nextline

exit:   mov ah,4ch
        int 21h


accepthex proc          ;A procedure which accepts a number and stores it in bl
        mov ah,01       ;Accept a number from
        int 21h         ;the keyboard and store in al

        sub al,30h
        cmp al,0ah
        jc down

        sub al,07h

        down:   mov cl,04
                shl al,cl
                mov bl,al

                mov ah,01
                int 21h

                sub al,30h
                cmp al,30h
                cmp al,0ah
                jc down1
                sub al,07h
        down1:  add bl,al
        disp bl
ret
accepthex endp


code ends
end start
