.model small
.stack 100h
.data
str1 db "Enter a string $"
str3 db 50 dup('$')
.code
	main proc 
		mov ax,@data
		mov ds,ax
		mov dx,offset str1
		
		mov ah,09h
		int 21h
		
		mov si,offset str3
		
again:	mov ah,01h
		int 21h
		
		cmp al,0dh
		je exit
		
		xor al,20h
		mov [si],al
		inc si
		jmp again 
exit:	
		mov dx,offset str3
		mov ah,09h
		int 21h
		
		

	mov ah,4ch
	int 21h
main endp
end main 