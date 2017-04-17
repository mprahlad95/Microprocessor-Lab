code segment
assume cs:code
start:
        mov bh,00h

back:   mov bl,bh
        and bl,0f0h

        mov cl,04h
        ror bl,cl
        call display

        mov bl,bh
        and bl,0fh
        call display

        mov al,bh
        add al,01
        daa

        mov bh,al
        call delay

        mov dl,13
        mov ah,02
        int 21h

        mov dl,0ffh
        mov ah,06
        int 21h

        jnz down

        up:     jmp back
        down:   cmp al,13
                jnz up

        mov ah,4ch
        int 21h

display proc
        add bl,30h
        mov dl,bl
        mov ah,02
        int 21h
ret


delay proc
        mov si,0ffffh
        up1:    mov di,0fffh
        up2:    dec di
                jnz up2
                dec si
                jnz up1
ret

code ends
end start
