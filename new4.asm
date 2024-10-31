.model small
.stack 100h
.386
.data
str1 db "Enter a hex number (0 to FFFF): $"
str2 db "Illegal hex digit, try again: $"
str3 db "In binary it is $"
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		mov dx,offset str1
		
		mov ah,09h
		int 21h
		
loop2:	mov cx,4
		xor bx,bx
again:	shl bx,4
		
		mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		cmp al,'a'
		jae err
		
		cmp al,'9'
		jbe digit
		
		sub al,7
		
digit:	sub al,48
		
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
		
		mov dx,offset str3
		
		mov ah,09h
		int 21h
		
		mov cx,16

loop1:	rol bx,1
		jc one
		
		mov dl,'0'
		jmp print
		
one:	mov dl,'1'

print:	mov ah,02h
		int 21h
		
		dec cx
		jnz loop1
		
		jmp ou
		
err:	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov dx,offset str2
		
		mov ah,09h
		int 21h
		
		
		jmp loop2
	
ou:	mov ah,4ch
	int 21h
	
main endp
end main 
