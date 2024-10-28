.model small
.stack 100h
.data
str1 db "InputString : $"
str2 db "CharToFind : $"
str3 db 10,13,"CharToReplace : $"
str4 db 10,13,"Modified string : $"
arr1 db 100 dup('$')
arr2 db 100 dup('$')
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov cx,0
		lea si,arr1
		
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		inc cx
		
		mov [si],al
		inc si
		jmp again
		
exit:
		lea dx,str2
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		
		mov bl,al
		
		lea dx,str3
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		
		mov bh,al
		
		lea di,arr1
		mov al,bl
		inc cx
again2:
		dec cx
		jz exit2
		cld
		scasb
		je change
		jmp again2
		
change:
		dec di
		mov [di],bh
		inc di
		jmp again2

exit2:
		lea dx,str4
		mov ah,09h
		int 21h
		lea dx,arr1
		mov ah,09h
		int 21h
	mov ah,4ch
	int 21h
	
main endp
end main