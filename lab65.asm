.model small
.stack 100h
.data
    str1 db "Enter numerator of first fraction: $"
    str2 db "Enter denominator of first fraction: $"
    str3 db "Enter numerator of second fraction: $"
    str4 db "Enter denominator of second fraction: $"
    num1 dw 0
    denom1 dw 0
    num2 dw 0
    denom2 dw 0
    result_num dw 0
    result_denom dw 0
    lcm_val dw 0
    temp dw 0

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ; Input for numerator of first fraction
    lea dx,str1
    mov ah,09h
    int 21h
    call getInput
    mov num1, ax
    
    ; Input for denominator of first fraction
    lea dx,str2
    mov ah,09h
    int 21h
    call getInput
    mov denom1, ax
    
    ; Input for numerator of second fraction
    lea dx,str3
    mov ah,09h
    int 21h
    call getInput
    mov num2, ax
    
    ; Input for denominator of second fraction
    lea dx,str4
    mov ah,09h
    int 21h
    call getInput
    mov denom2, ax

    ; Calculate LCM of denom1 and denom2
    mov ax, denom1
    mov bx, denom2
    call lcm
    mov lcm_val, ax

    ; Adjust numerators according to LCM
    mov ax, lcm_val
    mov bx, denom1
    xor dx, dx
    div bx
    mov bx, ax
    mov ax, num1
    mul bx
    mov result_num, ax

    mov ax, lcm_val
    mov bx, denom2
    xor dx, dx
    div bx
    mov bx, ax
    mov ax, num2
    mul bx
    add result_num, ax

    ; Result denominator is the LCM
    mov result_denom, lcm_val

    ; Display the result
    lea dx, result_num
    call printNum
    mov ah, 02h
    mov dl, '/'
    int 21h
    mov ax, result_denom
    call printNum

    ; Terminate program
    mov ah, 4Ch
    int 21h

getInput proc
    ; Get a multi-digit number from user input
    mov bx, 0
    again:
        mov ah, 01h
        int 21h
        cmp al, 13
        je doneInput
        sub al, '0'
        mov cl, al
        mov ch, 0
        mov ax, bx
        mov bx, 10
        mul bx
        add ax, cx
        mov bx, ax
        jmp again
    doneInput:
    mov ax, bx
    ret
getInput endp

gcd proc
    ; Calculate GCD of ax and bx, result in ax
    cmp bx, 0
    je done
    xor dx, dx
    div bx
    mov ax, bx
    mov bx, dx
    call gcd
done:
    ret
gcd endp

lcm proc
    ; Calculate LCM of ax and bx, result in ax
    push ax
    push bx
    call gcd
    pop bx
    mul bx
    pop dx
    xor dx, dx
    div dx
    ret
lcm endp

printNum proc
    ; Print number in ax
    mov cx, 0
    mov bx, 10
conv:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne conv

print:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print
    ret
printNum endp

end main
