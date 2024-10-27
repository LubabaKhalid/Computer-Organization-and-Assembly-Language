.model small
.stack 100h
.data
str1 db "Enter an odd number: $"
str2 db "Enter a three Characters String: $"
var1 db 0
var2 db 0
var3 db 0
arr1 db 4 dup('$')
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
		
exit:	mov ax,bx
		mov var2,bl
		mov bx,2
		div bx
		
		
	mov var3,al
		
	mov var1,1
	mov dx,0
again2: 
    cmp ax, 0
    je exit2
	mov bx,10
    mov dx, 0    
    div bx       

    push dx             

    jmp again2

exit2:
    pop dx       
    add dl, 48         

    dec var1
    jnz exit2
	
	mov bl,dl
	
	lea dx,str2
	mov ah,09h
	int 21h
	
	lea si,arr1
	mov cx,3
again3:

	mov ah,01h
	int 21h
	xor al,20h
	mov [si],al
	inc si
	dec cx
	jnz again3
	
	
	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
	mov bh,var2
	mov bl,var3
	mov ch,0
again5:	
	mov cl,0
	
	
star:	
	mov dl,'*'
	mov ah,02h
	int 21h
	inc cl
	cmp cl,bh
	jne star
	inc ch
	
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
	cmp ch,bl
	jne again5
	
	
	mov bh,var3
	dec bh
	dec bl
	
	
starr:
	mov dl,'*'
	mov ah,02h
	int 21h
	dec bh
	jnz starr
	
	
	lea dx,arr1
	mov ah,09h
	int 21h
	
starrr:
	mov dl,'*'
	mov ah,02h
	int 21h
	dec bl
	jnz starrr
	
	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
	mov bh,var2
	mov bl,var3
	mov ch,0
again6:	
	mov cl,0
	
	
stars:	
	mov dl,'*'
	mov ah,02h
	int 21h
	inc cl
	cmp cl,bh
	jne stars
	inc ch
	
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
	cmp ch,bl
	jne again6
	
	mov ah,4ch
	int 21h
	
main endp
end main