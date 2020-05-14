.386
.model flat, stdcall
option casemap : none
.code
start:
    mov ax, 7FF0h
    add al, 10h
    add ah, 1
    add ax, 2
    ret
    end start
