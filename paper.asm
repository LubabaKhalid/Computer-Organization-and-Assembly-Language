.model small
.stack 100h
.data
array1 dw 45,52,56,58,89,99,53
noOfElements dw 7
var1 db 0
.code
	main proc
	
	mov ax,@data
	mov ds,ax
	lea si,array1
	mov cx,noOfElements
	
	mov bx,0
again:
	mov ax,[si]
	add bx,ax
	add si,2
	dec noOfElements
	jnz again
	
	mov ax,bx
	
again2:
	cmp ax,cx
	jb multiply
	mov dx,0
	div cx
	mov bx,dx
	mov dx,ax
	
	cmp dx,'9'
	ja process
	
	add dx,48
	mov ah,02h
	int 21h
	mov ax,bx
	jmp again2
	
	
process:
push bx
	mov ax,dx
loop2:
	cmp ax,0
	je exit
	mov bx,10
	mov dx,0
	div bx
	inc var1
	push dx
	jmp loop2
exit:
	pop dx
	add dx,48
	mov ah,02h
	int 21h
	dec var1
	jnz exit
	pop bx
	mov ax,bx
	jmp again2
	

multiply:
	mov bx,ax
	mov dl,'.'
	mov ah,02h
	int 21h
	
	mov ax,bx
	
	mov bx,10
	mul bx
	div cx
	mov dx,ax
	add dx,48
	mov ah,02h
	int 21h
	
	
	
	
	
	mov ah,4ch
	int 21h
	
main endp
end main