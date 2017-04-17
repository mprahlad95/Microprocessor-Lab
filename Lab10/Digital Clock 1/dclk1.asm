data segment
        sec db ?
        min db ?
        hour db ?
data ends

code segment
assume cs:code, ds:data
start:
        mov ax,data
        mov ds,ax
        mov sec,01h
        mov min,00h
        mov hour,00h

back:   mov al, sec
        and al, 0f0h
        mov cl, 04h
        ror al, cl
        mov sec,al
        call display

        mov al,sec
        and al,0fh
        mov sec,al
        call display

        mov al,sec
        add al,01
        daa
        mov sec,al

        cmp sec,59h
        je minute
        jne skip

        minute: mov sec,00h
                inc min
                cmp min,59h
                jz hours
                jnz skip

        hours:  mov min,00h
                inc hour
        skip:        

        call delay

        mov dl,0ffh       ;to stop at key press
        mov ah,06
        int 21h

        jnz down

        up:     jmp back
        down:   cmp al,13
                jnz up

mov ah,4ch
int 21h

display proc
        mov bl,hour
        add bl,30h
        mov dl,bl
        mov ah,02
        int 21h

        mov dl,':'
        mov ah,02
        int 21h
        
        mov bl,min
        add bl,30h
        mov dl,bl
        mov ah,02
        int 21h

        mov dl,':'
        mov ah,02
        int 21h

        mov bl,sec
        add bl,30h
        mov dl,bl
        mov ah,02
        int 21h

        mov dl,13
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
