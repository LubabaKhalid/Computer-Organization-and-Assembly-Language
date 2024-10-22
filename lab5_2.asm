.model small
.stack 100h
.data

str1 db "Enter a string : $"
str2 db "You enter : $"
arr1 dw 100 dup("$")
.code
	main proc
		
		mov ax,@data
		mov ds,ax
		lea dx ,str1
		
		lea si,arr1
		
		mov ah,09h
		int 21h
		
		mov cx,0
		
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		cmp al," "
		je print
		
		
		
		push ax
		inc cx
		jmp again
		
		
		

		
print:		pop dx
		mov [si],dx
		inc si
		dec cx
		jnz print
		
		mov [si],al
		inc si
		
		jmp again 
		

exit:	
		pop dx
		mov [si],dx
		inc si
		
		
		dec cx
		jnz exit
		
		mov al,' '
		
		mov [si],al
		
		lea dx ,str2
		
		mov ah,09h
		int 21h
		
		lea dx,arr1
		mov ah,09h
		int 21h
	
		
	mov ah,4ch
	int 21h
	
main endp
end main