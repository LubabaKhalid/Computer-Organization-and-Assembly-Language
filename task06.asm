.model small
.stack 100h
.data
	
.code
	main proc
		mov bx,10
bb:		mov dl,'*'
		mov cx,10
aa:		mov ah,02h
		int 21h
		dec cx
		jnz aa
		mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
		dec bx
		jnz bb
		
		
	mov ah,4ch
	int 21h
main endp
end main