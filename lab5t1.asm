.model small
.stack 100h
.386
.data
.code
	main proc 
		mov ah,01h
		int 21h
		
		mov bl,al
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov ch,0
		mov cl,8
again:	rol bl,1
		jc one 
		
		mov dl,'0'
		jmp print
		
one:	inc ch
		mov dl,'1'
		
print:	mov ah,02h
		int 21h
		
		dec cl
		jnz again
		
		add ch,48
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov dl,ch
		mov ah,02h
		int 21h

	mov ah,4ch
	int 21h
main endp
end main 