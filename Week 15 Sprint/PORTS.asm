	PA EQU 30h
        PB EQU 31h
        CB EQU 33h
        
        ORG	2000H	; Memoria de Datos
        ; LEDS -> Puerto B out ()
        ; Interru -> Puerto A in (30H)
        ;CB = 00000000 ;1=Input; 0=Output
        IN AL, (PA)
        
        MOV AL, 00
        OUT (CB), AL ; o 33 00 configurar el puerto B (PB)
        ;-> AHORA con 55 aa; 01010101 10101010
        ;Unos leds se prenden y luego esos leds se apagan y asi sucesivamente
 
 L1:    XOR AL, AL ; AL=0
        MOV AL, 55h
        OUT (PB), AL ;Apaga los LEDS 
        
        MOV AL, 0aah
        OUT (PB), AL ;Enciende los LEDS
        JMP L1
                    
	END



