.model small
.stack 100h
.386
.data
str1 db "Enter a binary number up to 16 digits:$ "
str2 db "In Hex it is $ "
.code
	main proc 
	
	    mov ax,@data
		mov ds,ax
		mov dx,offset str1
		
		mov ah,09h
		int 21h
		
		mov bl,0b
		mov cx,8
again:	mov ah,01h
		int 21h
		
		cmp al,0Dh
		je exit
		
		sub al,48d
		
		shl bl,1
		or bl,al
		dec cx
		jnz again
exit:
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h 
		
		
		mov ax,@data
		mov ds,ax
		mov dx,offset str2
		
		mov ah ,09h
		int 21h 
		
		mov cx,2
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
		
	mov ah,4ch
	int 21h
main endp
end main 
