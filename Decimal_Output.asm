.model small
.stack 100h
.data
.code
	main proc
		
		mov ax,235
		mov cx,0
		
again:	cmp ax,0
		je exit
		
		mov dx,0
		mov bx,10
		div bx
		
		push dx
		inc cx
		jmp again 
exit:	
		pop dx
		add dx,48
		mov ah,02h
		int 21h
		dec cx
		jnz exit
		
		
	mov ah,4ch
	int 21h
	
main endp
end main 
