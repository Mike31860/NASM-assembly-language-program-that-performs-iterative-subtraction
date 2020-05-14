.386
.model flat, stdcall
option casemap : none
.code
start:
    push ebp
    mov ebp, esp
    mov DWORD PTR [ebp-32], 1
    mov DWORD PTR [ebp-28], 2
    mov DWORD PTR [ebp-24], 3
    mov DWORD PTR [ebp-20], 4
    mov DWORD PTR [ebp-16], 5
    mov DWORD PTR [ebp-4], 0
    mov DWORD PTR [ebp-8], 0
    jmp L2

L3:
    mov eax, DWORD PTR [ebp-8]
    mov eax, DWORD PTR [ebp-32+eax*4]
    add DWORD PTR [ebp-4], eax
    add DWORD PTR [ebp-8], 1

L2:
    cmp DWORD PTR [ebp-8], 3
    jle L3
    mov eax, 0
    pop ebp
    xor eax, eax
    ret
    end start