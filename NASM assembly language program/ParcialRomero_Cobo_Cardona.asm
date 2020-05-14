%include "io.inc"
section .data
Contador dd 0
ValorMenor dd 0
A dd 9 ;Cristian Andres Cobo A00348619
B dd 9 ;Juan Sebastian Cardona A00346539
C dd 2 ;Miguel Romero A00052672
BD_Dato1 db "0000005.30",0 ;Minuendo
BD_Delta db "0001013.90",0 ;Sustraendo
BD_Result db "0000000.00",0 ; Variable para almacenar el resultado
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging ; Inicio del programa
    mov ebp, esp
    lea esi, [BD_Dato1]  ;Almacena la direccion efectiva en memoria de la variable en el registro
    push BD_Dato1 ;Ingresa el valor de la variable a la pila
    call Length ;Hace llamado a la funcion  CALL (por debajo un push)
    mov [Contador], ecx
    add esp, 4
    mov ecx, 0
        
PrimerFor: ;Subrutina para realizar llamados del primer for (general)
    push ecx; Se ingresa el registro a la pila
    cmp ecx, 0 ;Se realiza la respectiva comparacion 
    jne Case
    mov ecx, 0
      
ForCaso0: ; Subrutina para realizar el primer llamado del primer for interno  
    push ecx
    push BD_Dato1
    push BD_Delta
    push Contador
    call Comparador
    add esp, 12
    push BD_Result
    push BD_Dato1
    push BD_Delta
    push Contador
    call Subtract
    mov ecx, 0
      
Primero: ; Complementacion operacion primer for interno
    lea esi, [BD_Dato1]
    mov al, [BD_Result+ecx]
    mov [esi+ecx], al
    inc ecx
    cmp ecx, [Contador]
    jne Primero
    add esp, 16
    pop ecx
    inc ecx
    cmp ecx, [A]
    jl ForCaso0
    jmp break
        
Case: ; Caso 0
    cmp ecx, 1
    jne ForCase2
    mov ecx, 0
        
ForCaso1:
    push ecx
    push BD_Dato1
    push BD_Delta
    push Contador
    call Comparador
    add esp, 12
    push BD_Result
    push BD_Dato1
    push BD_Delta
    push Contador
    call Subtract
    mov ecx, 0
        
Segundo: ;Complementacion de la opracion para el segundo for interno 
    lea esi, [BD_Dato1]
    mov al, [BD_Result+ecx]
    mov [esi+ecx], al
    inc ecx
    cmp ecx, [Contador]
    jne Segundo
    add esp, 16
    pop ecx
    inc ecx
    cmp ecx, [B]
    jl ForCaso1
    jmp break
           
ForCase2:
    cmp ecx, 2
    jne Defaulttt
    mov ecx, 0
    
ForCaso2: ;For No. 2 interno
    push ecx
    push BD_Dato1
    push BD_Delta
    push Contador
    call Comparador
    add esp, 12  
    push BD_Result
    push BD_Dato1
    push BD_Delta
    push Contador
    call Subtract
    mov ecx, 0
       
Tercero: ; Complementacion de la opracion para el tercr for intrno 
    lea esi, [BD_Dato1]
    mov al, [BD_Result+ecx]
    mov [esi+ecx], al
    inc ecx
    cmp ecx, [Contador]
    jne Tercero    
    add esp, 16  
    pop ecx
    inc ecx
    cmp ecx, [C]
    jl ForCaso2
    jmp break
    Defaulttt: ; Subrutina que indica la terminacion de la estructura SC
    break:   
    pop ecx
    inc ecx
    cmp ecx, 3
    jl PrimerFor
    xor eax, eax
    ret
    
Length: ;Subrutina para obetener el tamaño
    push ebp
    mov ebp, esp    
    xor ecx, ecx
    mov esi, [ebp+8]
    init:
    mov al, [esi + ecx]
    inc ecx
    cmp al, 0  
    jne init
    dec ecx
    dec ecx    
    pop ebp
    ret

Comparador: ; Subrutina para realizar comparaciones
    push ebp
    mov ebp, esp  
    mov esi, [ebp+16]
    mov edi, [ebp+12]  
    mov ecx, [ebp+8]
    mov ecx, [ecx]
    mov edx, 0
       
L68:
    mov al, [esi+edx]
    mov bl, [edi+edx]
    cmp al, bl
    jc Minimo
    jg FinPrograma    
    inc edx
    cmp ecx, edx
    jne L68
    jmp FinPrograma
           
Minimo:
    mov eax, 1
    mov [ValorMenor], eax
    
FinPrograma:    
    mov esp, ebp
    pop ebp
    ret
    
Subtract: ; Subrutina para realizar el llamado a la funcion sustracion
    push ebp
    mov ebp, esp    
    mov esi, [ebp+16]
    mov edi, [ebp+12]
    mov edx, [ebp+20]   
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx    
    mov ecx, [ebp+8]
    mov ecx, [ecx]  
    mov al, [esi]
    cmp al, '-'
    jne L1
    push edx
    push esi
    push edi
    push ecx
    call Suma
    add esp, 16
    jmp L2
    
L1:
    mov al, [ValorMenor]
    cmp al, 1
    je LBA
   
L3:
    mov al, [esi+ecx]
    mov bl, [edi+ecx]
    cmp al,'.'
    je L4
    sub al, bl
    pushfd
    add al, ah
    xor ah,ah
    popfd
    aas
    add al,30h
     
L4:
    mov [edx+ecx], al
    dec ecx
    cmp ecx,-1
    jne L3
    jmp L2  
    LBA:

L5:
    mov al, [edi+ecx]
    mov bl, [esi+ecx]
    cmp al,'.'
    je L6
    sub al, bl
    pushfd
    add al, ah
    xor ah,ah
    popfd
    aas
    add al,30h
     
L6:
    mov [edx+ecx], al
    dec ecx
    cmp ecx,-1
    jne L5
    mov al, '-'
    mov [edx], al 
    
    L2:
    mov esp, ebp
    pop ebp
    ret
    
Suma: ;Subrutina para llamar a la funcion Suma
    push ebp
    mov ebp, esp   
    mov esi, [ebp+16]
    mov edi, [ebp+12]
    mov edx, [ebp+20]    
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx    
    mov ecx, [ebp+8]
    
L7:
    mov al, [esi+ecx]
    mov bl, [edi+ecx]
    cmp al,'.'
    je L8
    add al, bl
    pushfd
    add al, ah
    xor ah,ah
    popfd
    AAA
    add al,30h
      
L8:
    mov [edx+ecx], al
    dec ecx
    cmp ecx,0
    jne L7    
    mov al, '-'
    mov [edx], al 
    mov esp, ebp
    pop ebp
    ret