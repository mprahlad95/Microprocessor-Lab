code segment
assume cs:code
start:
        mov bh,00h

back:   mov bl,bh        ;move to bl
        and bl,0f0h      ;and with f0 so that msb is considered

        mov cl,04h
        ror bl,cl        ;rotate by 04 to right
        cmp bl,0ah
        js skip
         add bl,07h
        skip:        
        call display     ;display bl

        mov bl,bh        ;move bh again to bl
        and bl,0fh       ;and with 0f so that lsb is considered
        cmp bl,0ah
        js skip1
         add bl,07h
        skip1:        
        call display     ;display

        mov al,bh        ;move bh to al
        add al,01        ;and add 1
        mov bh,al        ;move back to bh

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
