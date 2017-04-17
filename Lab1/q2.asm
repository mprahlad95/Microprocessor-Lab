code segment
assume cs:code
start:
        mov ax,1234h
        mov bx,9999h
        add cx,ax
        add cx,bx
        int 21h
code ends
end start
