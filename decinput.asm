.model small
.stack 100h
.data
str1 db "Enter numbers : $"
str2 db "reversed :$"
var1 db 0
.code
	main proc
		
		mov ax,@data
		mov ds,ax
		lea dx,str1
		mov ah,09h
		int 21h
		
		
		mov bx,0
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		sub al,48
		mov cl,al
		
		mov ch,0
		mov ax,bx
		
		mov bx,10
		mul bx
		
		add ax,cx
		mov bx,ax
		inc var1
		jmp again
 
		
		
		
		
		
exit:
	lea dx,str2
	mov ah,09h
	int 21h
	
	mov ax,bx
	mov dx,0
again2: 
    cmp ax, 0
    je exit2
	mov bx,10
    mov dx, 0    
    div bx       
	
	push ax
	
	add dl,48
	mov ah,02h
	int 21h
	
	pop ax
    push dx             

    jmp again2

exit2:
    pop bx       
          

    dec var1
    jnz exit2
		
	mov ah,4ch
	int 21h

main endp
end main