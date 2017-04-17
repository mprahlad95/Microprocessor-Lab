code segment
assume cs:code
start:
        mov ax, 0ff12h
code ends
end start


xyz segment
assume cd:xyz
start:
        mov bx, 1234h
xyz ends
end start
