.386
.model flat, stdcall
option casemap : none
.code
start:
    push ebp
    mov ebp, esp
    mov DWORD PTR [ebp-24], edi
    mov DWORD PTR [ebp-28], esi
    mov DWORD PTR [ebp-4], 0
    mov DWORD PTR [ebp-8], 0
    jmp L2
L3:
    mov eax, DWORD PTR [ebp-8]
    lea edx, [0+eax*4]
    mov eax, DWORD PTR [ebp-24]
    add eax, edx
    mov eax, DWORD PTR [eax]
    add DWORD PTR [ebp-4], eax
    add DWORD PTR [ebp-8], 1
L2:
    mov eax, DWORD PTR [ebp-8]
    cmp eax, DWORD PTR [ebp-28]
    jl L3
    mov eax, DWORD PTR [ebp-4]
    pop ebp
    xor eax, eax
    ret
    end start