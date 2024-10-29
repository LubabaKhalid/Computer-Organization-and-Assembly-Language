.model small
.stack 100h
.data
    str1 db "Enter a Key $"
    str2 db 10,13,"The ascii code in decimal is: $ "
	str3 db 10,13,"The ascii code in hexadecimal is :$"
	str4 db 10,13,"The ascii code in binary is :$"
.code
main proc
    mov ax, @data
    mov ds, ax

   
    lea dx, str1
    mov ah, 09h
    int 21h

    
    mov ah, 01h 
    int 21h
    mov bl, al  

    
    lea dx, str2
    mov ah, 09h
    int 21h

    mov bh,0
	
    mov ax, 0    
    mov al, bl 
	push bx
    mov bx, 10   
    call decimal
	
	pop bx
	lea dx, str3
    mov ah, 09h
    int 21h

    
    mov ax, 0    
    mov al, bl
	push bx
	
    mov bx, 16  
    call decimal
	
	pop bx
	lea dx, str4
    mov ah, 09h
    int 21h

    
    mov ax, 0    
    mov al, bl
	
    mov bx, 2  
    call decimal

   
    mov ah, 4Ch
    int 21h

main endp

decimal proc
	push bx
	mov cx,0
again: 
    cmp ax, 0
    je exit

    mov dx, 0    
    div bx       

    push dx      
    inc cx       

    jmp again

exit:
    pop dx       

    cmp dl, 9
    jbe digit

    add dl, 7h   

digit:
    add dl, 48   
    mov ah, 02h
    int 21h      

    dec cx
    jnz exit
	
	pop bx

    ret
decimal endp

end main
