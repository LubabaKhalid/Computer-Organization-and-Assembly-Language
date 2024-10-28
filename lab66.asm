.model small
.stack 100h

.data
    msg1 db 'Enter numerator of first fraction: $'
    msg2 db 'Enter denominator of first fraction: $'
    msg3 db 'Enter numerator of second fraction: $'
    msg4 db 'Enter denominator of second fraction: $'
    msgResult db 'The result is: $'
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
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Get first fraction
    lea dx, msg1
    mov ah, 09h
    int 21h

    call getInput
    mov num1, ax

    lea dx, msg2
    mov ah, 09h
    int 21h

    call getInput
    mov denom1, ax

    ; Get second fraction
    lea dx, msg3
    mov ah, 09h
    int 21h

    call getInput
    mov num2, ax

    lea dx, msg4
    mov ah, 09h
    int 21h

    call getInput
    mov denom2, ax

    ; Calculate LCM of denom1 and denom2
    mov ax, denom1
    mov bx, denom2
    call lcm
    mov lcm_val, ax

    ; Adjust numerators
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
    mov dx, lcm_val
	mov result_denom,dx
    ; Display the result
    lea dx, msgResult
    mov ah, 09h
    int 21h

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
    ; Get a 4-digit number from user input
    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    mov bx, 10
    mul bx

    int 21h
    sub al, '0'
    add ax, 0
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

main endp
end main
