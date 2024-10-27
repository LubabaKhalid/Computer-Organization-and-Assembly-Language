.model small
.stack 100h
.386
.data
str1 db "Enter a hex number (0 to FFFF): $"
str2 db "In binary it is: $"
str3 db "Illegal hex digit, try again: $"
.code
	main proc 
		
		mov ax,@data
		mov ds,ax
		mov dx,offset str1
		
		mov ah,09h
		int 21h 
		
loop1:	mov cx,4
		xor bx,bx
		
again:	mov ah,01h
		int 21h
		
		cmp al,0dh
		je exit
		
		cmp al,'9'
		jbe aa
		
		cmp al,'a'
		jae err
		
		sub al,7
aa:		sub al,48
		
		rol bx,4
		or bl,al
		
		dec cx 
		jnz again
		
		
		
exit:	
		
		mov cx,16 
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h 
		
		mov dx,offset str2
		
		mov ah,09h
		int 21h 
		
cc:		rol bx,1
		jc one
		
		mov dl,'0'
		jmp print
		
one:	mov dl,'1'

print:	mov ah,02h
		int 21h
		
		dec cx
		jnz cc
		
		jmp en
		
err:	mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h 
		
		mov dx,offset str3
		
		mov ah,09h
		int 21h	
		jmp loop1
		
en:	mov ah,4ch
	int 21h
main endp
end main 