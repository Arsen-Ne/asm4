.486

PUBLIC @SumMinMax3@8
PUBLIC SumMinMax
PUBLIC _SumMinMax2
PUBLIC _Min@8
PUBLIC Max


.model flat
.data
.code

@SumMinMax3@8 proc
    push esi    
    push edi

    mov ebx,ecx ;//занесение адреса массива b           
    mov ecx,edx
    mov esi,ebx ;// min address
    mov eax,[esi] ;// min value
    mov edi,ebx ;// max address
    mov edx,eax ;// max value
        
    add ebx,4 
l1 :
    cmp eax, [ebx] ;// сравниваем минимум с текущим
    jle e1 ;// если (eax < [ebx] == true) меньше 1й, то jmp to e1
    mov esi,ebx
    mov eax,[ebx]
    jmp e2
e1:
    cmp edx, [ebx]
    jge e2
    mov edi, ebx
    mov edx, [ebx]
e2 :
    add ebx, 4
    loop l1

    xor eax, eax

    cmp esi, edi
    jl e3
    mov ebx, edi            
    mov ecx, esi
    jmp l2
e3 : 
    mov ebx, esi
    mov ecx, edi    

l2:
    add eax,[ebx]
    add ebx,4
    cmp ebx,ecx
    jle l2

    pop edi
    pop esi
    ret
@SumMinMax3@8 endp

; *********************************************

_SumMinMax2 proc
push ebp
mov ebp, esp
push [ebp+12]
push [ebp+8]
call SumMinMax
mov esp, ebp
pop ebp
ret
_SumMinMax2 endp

; *********************************************

SumMinMax proc stdcall, a: dword, b: dword
    push esi    
    push edi

    mov ebx,a ;//занесение адреса массива b          
    mov ecx,b
    mov esi,ebx ;// min address
    mov eax,[esi] ;// min value
    mov edi,ebx ;// max address
    mov edx,eax ;// max value
        
    add ebx,4 
l1 :
    cmp eax, [ebx] ;// сравниваем минимум с текущим
    jle e1 ;// если (eax < [ebx] == true) меньше 1й, то jmp to e1
    mov esi,ebx
    mov eax,[ebx]
    jmp e2
e1:
    cmp edx, [ebx]
    jge e2
    mov edi, ebx
    mov edx, [ebx]
e2 :
    add ebx, 4
    loop l1

    xor eax, eax

    cmp esi, edi
    jl e3
    mov ebx, edi            
    mov ecx, esi
    jmp l2
e3 : 
    mov ebx, esi
    mov ecx, edi    

l2:
    add eax,[ebx]
    add ebx,4
    cmp ebx,ecx
    jle l2

    pop edi
    pop esi
    ret
SumMinMax endp

; *********************************************

_Min@8 proc
    push ebp
    mov ebp,esp
    push esi    
    push edi

    mov ebx,[ebp+8] ;//занесение адреса массива b          
    mov ecx,[ebp+12]
    mov esi,ebx ;// min address
    mov eax,[esi] ;// min value   
        
    add ebx,4 
l1 :
    cmp eax, [ebx] ;// сравниваем минимум с текущим
    jle e1 ;// если (eax < [ebx] == true) меньше 1й, то jmp to e1
    mov esi,ebx
    mov eax,[ebx]  
e1:
    add ebx, 4
    loop l1

    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret 8
_Min@8 endp

; *********************************************

Max proc C, a:dword, b:dword    
    push esi    
    push edi

    mov ebx,a ;//занесение адреса массива b          
    mov ecx,b
    mov esi,ebx ;// max address
    mov eax,[esi] ;// max value   
        
    add ebx,4 
l1 :
    cmp eax, [ebx] ;// сравниваем минимум с текущим
    jge e1 ;// если (eax > [ebx] == true)
    mov esi,ebx
    mov eax,[ebx]  
e1:
    add ebx, 4
    loop l1

    pop edi
    pop esi    
    ret
Max endp

end
