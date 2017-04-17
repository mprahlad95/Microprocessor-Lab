code segment
assume cs:code
start:
        mov bh,00h

back:
        
        mov bl,bh

        cmp bh,00h
        jne skipA       ;here if bh=00, then ch becomes 1
         mov ch,01h
        skipA:

        cmp bh,0ffh
        jne skipB
         mov ch,00h      ;here if bh=00, then ch becomes 1
        skipB:
        
        and bl,0f0h

        mov cl,04h
        ror bl,cl                              
        cmp bl,0ah
        js skip
         add bl,07h
        skip:        
        call display                 

        mov bl,bh      
        and bl,0fh      
        cmp bl,0ah
        js skip1
         add bl,07h
        skip1:        
        call display    

        mov al,bh
        cmp ch,01h
        je increment
         sub al,02
        increment:  add al,01       
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
        up1:    mov di,0ffh
        up2:    dec di
                jnz up2
                dec si
                jnz up1
ret

code ends
end start
