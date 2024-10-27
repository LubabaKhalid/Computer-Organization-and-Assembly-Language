.model small
.stack 100h
.data
table1	db 65 dup(?)
		db 'EFGHIJKLMNOPQRSTUVWXYZABCD'
		db 6 dup(?)
		db 'efghijklmnopqrstuvwxyzabcd'
table2  db 65 dup(?)
		db 'WXYZABCDEFGHIJKLMNOPQRSTUV'
		db 6 dup(?)
		db 'wxyzabcdefghijklmnopqrstuv'
str1 db 100 dup('$')
str2 db "Enter String : $"
str3 db "After encoding : $"
str4 db 10,13,"After decoding : $"
str5 db 100 dup('$')
.code
	main proc
	
		mov ax,@data
		mov ds,ax
		
		lea dx,str2
		mov ah,09h
		int 21h
		
		lea si,str1
		mov cx,0
		
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		mov bx,offset table1
		xlat
		
		inc cx
		mov [si],al
		inc si
		jmp again
		
exit:	lea dx,str3
		mov ah,09h
		int 21h
		
		lea dx,str1
		mov ah,09h
		int 21h
	
		lea dx,str4
		mov ah,09h
		int 21h
		
		lea si,str1
		lea di,str5
again2:	
		mov al,[si]
		lea bx,table2
		
		xlat
		
		mov [di],al
		inc di
		inc si
		dec cx
		jnz again2
		
		lea dx,str5
		mov ah,09h
		int 21h
		
	
	mov ah,4ch
	int 21h
	
main endp
end main