.model small
.stack 100h
.386
.data
.code
	main proc 
		mov cx,4
		mov bx,0100001111000010b
again:	rol bx,4
		mov dl,bl
		and dl,0fh
		
		cmp dl,9
		jbe digit
		
		add dl,7d
		
digit:	add dl,48d

		mov ah,02h
		int 21h
		
		dec cx
		jnz again
		
	mov ah,4ch
	int 21h
main endp
end main 