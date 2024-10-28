.model small
.stack 100h
.data

str1 db "Prime number $"
str2 db "Not a prime number $"
str3 db "Enter number $"
var1 db 0
var2 db 0
.code
	main proc
	
	mov ax,@data
	mov ds,ax
	
	lea dx,str3
	mov ah,09h
	int 21h
	
	mov bx,0
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		sub al,48
		mov cl,al
		
		mov ch,0
		mov ax,bx
		
		mov bx,10
		mul bx
		
		add ax,cx
		mov bx,ax
		inc var1
		jmp again
		
		
exit:	
		push bx
		
		mov dx,0
		mov ax,bx
		mov bx ,2
		div bx
		
		mov cx,ax
		pop ax
		mov bx,cx
		
		
		
loop1:
		div bx
		cmp dx,0
		je Prime
		dec var1
		jnz loop1
		
		lea dx ,str1
		mov ah,09h
		int 21h
		jmp finish
		
Prime:	lea dx,str2
		mov ah,09h
		int 21h
		jmp finish
		
		
		
		
		
finish:		
	mov ah,4ch
	int 21h
	
main endp
end main 