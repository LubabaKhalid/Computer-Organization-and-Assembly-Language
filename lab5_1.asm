.model small
.stack 100h
.386
.data
	arr1 db 5 dup('$')
	var1 db 5
.code
	main proc 
		mov ax,@data
		mov ds,ax
		mov si,offset arr1
		
		
loop1:	mov bl,0b
		mov cx,8
		
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		sub al,'0'
		
		shl bl,1
		or bl,al
		
		dec cx
		jnz again
		
exit:	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov [si],bl
		inc si 
		
		dec var1
		jnz loop1
		
		
		
		lea si,arr1
		
loop2:	mov cx,2
		mov bl,[si]
		
print:	rol bl,4
		mov dl,bl
		and dl,0fh
		
		cmp dl,9
		jbe digit
		
		add dl,7
digit:	add dl,48
		mov ah,02h
		int 21h
		
		dec cx
		jnz print
		
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h 
		
		inc si
		inc var1
		cmp var1,5
		jne loop2
		
		
	mov ah,4ch
	int 21h
main endp
end main 