.386
.model flat, stdcall
option casemap : none
.data
myBytes BYTE 10h, 20h, 30h, 40h
myWords WORD 8Ah, 3Bh, 72h, 44h, 66h
myDoubles DWORD 1,2,3,4,5
myPointer DWORD myDoubles

.code
start:
    mov esi, OFFSET myBytes 
    mov al, [esi]                    ; a. AL =  10h
    mov al, [esi+3]                  ; b. Al =  40h
    mov esi, OFFSET myWords +2 
    mov ax, [esi]	             ; c. AX = 003Bh
    mov edi, 8
    mov edx, [myDoubles + edi]       ; d. EDX = 3
    mov edx, myDoubles[edi]	     ; e. EDX = 3
    mov ebx, myPointer 
    mov eax, [ebx+4]	             ; f. EAX = 2
    ret
    end start
