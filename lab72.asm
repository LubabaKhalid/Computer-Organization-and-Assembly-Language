.model small
.stack 100h
.data
str1 db "MyStr : $"
str2 db "ch : $"
arr1 db 100 dup("$")
arr2 db 100 dup("$")
.code
	main proc
	
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea si,arr1
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov cx,0
		
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
		
		mov ah,0
		mov bh,al
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		lea di,arr1
		lea si,arr2
		
		
		mov al,bh
		
		inc cx
loop1:	dec cx
		jz exit1
		
		cld
		mov bl,[di]
		scasb
		jne Noinsert
		jmp loop1
		
Noinsert:	
		mov [si],bl
		inc si
	
		jmp loop1
		
exit1:
		lea dx,arr2
		mov ah,09h
		int 21h
		
	
	
	
	mov ah,4ch
	int 21h
	
main endp
end main