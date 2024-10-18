.model small
.stack 100h
.386
.data
    arr1 db 2 dup('$')
    str1 db "Enter a hexa number 0 to FFFFh: $"
    str2 db "Sum in hexa: $"
    var1 db 2
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset arr1
    mov di, offset arr1

    mov dx, offset str1
    mov ah, 09h
    int 21h

loop1:
    mov bx, 0
    mov cx, 4
again:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je binend

    cmp al, '9'
    jbe digit
    sub al, 7h
digit:
    sub al, 30h

    shl bx, 4
    or bl, al
    dec cx
    jnz again

binend:
    mov dl, 10    ; Newline
    mov ah, 02h
    int 21h
    mov dl, 13    ; Carriage return
    mov ah, 02h
    int 21h

    mov [si], bx
    add si, 2
    dec var1
    jnz loop1

    mov dl, 10    ; Newline
    mov ah, 02h
    int 21h
    mov dl, 13    ; Carriage return
    mov ah, 02h
    int 21h

    mov bx, [di]
    add di, 2
    mov ax, [di]
    add bx, ax

    mov dx, offset str2
    mov ah, 09h
    int 21h

    mov cx, 4
loop2:
    rol bx, 4
    mov dl, bl
    and dl, 0Fh
    cmp dl, 9
    jbe digit1
    add dl, 7h
digit1:
    add dl, 30h
    mov ah, 02h
    int 21h
    dec cx
    jnz loop2

    mov ah, 4Ch
    int 21h
main endp
end main
