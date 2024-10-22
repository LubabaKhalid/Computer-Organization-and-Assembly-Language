.model small
.stack 100h
.data
str1 db "String is palindrome $"
str2 db "String is not palindrome $"
arr1 db 100 dup("$")
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		lea si,arr1
		
		mov cx,0
		
loop1:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		mov [si],al
		inc si
		inc cx
		jmp loop1
		
		
exit:	dec si
		lea di,arr1
		
loop2:		mov bl,[di]
		mov bh,[si]
		
		cmp di,si
		jae true
		
		cmp bl,bh
		jne wrong
		
		inc di
		dec si
		jmp loop2
		
wrong:	lea dx,str2
		mov ah,09h
		int 21h
		jmp exit1
		
true:	lea dx,str1
		mov ah,09h
		int 21h

exit1:

		
	mov ah,4ch
	int 21h
	
main endp
end main