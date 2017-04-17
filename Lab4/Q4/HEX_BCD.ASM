data segment
hex db ?
bcd db 2 dup(?)
data ends

code segment
assume cs:code, ds:data
start: mov ax,data
       mov ds,ax

       mov al,hex
       mov ah,0
       mov bl,0ah
       div bl
       mov bh,ah
       mov ah,0
       div bl
       mov bcd+1,al
       mov cl,04
       shl ah,cl
       add ah,bh
       mov bcd,ah

       mov ah,4ch
       int 21h

    code ends
    end start

