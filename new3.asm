.model small
.stack 100h
.386
.data
str1 db "Enter a character: $"
str2 db "The ASCII code of $"
str3 db " in HEXA is $"
.code
	main proc
		mov ax,@data
		mov ds,ax
		
loop1:	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov dx,offset str1
		
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		
		mov bl,al
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov dx,offset str2
		
		mov ah,09h
		int 21h
		
		mov dl,bl
		mov ah,02h
		int 21h
		
		mov dx,offset str3
		
		mov ah,09h
		int 21h
		
		mov cx,2
		
again:	rol bl,4
		
		mov dl,bl
		and dl,0fh
		
		cmp dl,9
		jbe digit
		
		add dl,7
		
digit:	add dl,48		
		
		mov ah,02h
		int 21h
		
		dec cx
		jnz again
		
		mov ah,01h
		int 21h
		
		cmp al,13
		jne loop1
		
	
	mov ah,4ch
	int 21h
	
main endp
end main 
