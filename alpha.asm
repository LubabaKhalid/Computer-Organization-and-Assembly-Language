.model small
.stack 100h
.386
.data
arr1 db 2 dup('$')
	str1 db "Enter a binary number up to 8 digits: $"
	var1 db 2
	str2 db "The binary sum is: $"
.code
	main proc 
		
		mov ax,@data
		mov ds,ax
		
		mov si,offset arr1
		mov di,offset arr1
		
loop1:	
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov dx,offset str1
		mov ah,09h
		int 21h
		
		mov bl,0
		mov cx,8
again:	mov ah,01h
		int 21h
		
		cmp al,0Dh
		je binend
		
		sub al,48
		
		shl bl,1
		or bl,al
		dec cx
		jnz again
		
		
binend: mov [si],bl
		inc si 
		dec var1
		jnz loop1
		
		mov bl,[di]
		inc di
		mov bh,[di]
		
		add bl,bh
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov di,offset str2
		mov ah,09h
		int 21h
		
		mov cx,8

loop2:	rol bl,1
		jc one
		
		mov dl,'0'
		jmp print
		
one:	mov dl,'1'

print:	mov ah,02h
		int 21h
		
		dec cx
		jnz loop2
		
	mov ah,4ch
	int 21h
main endp
end main 