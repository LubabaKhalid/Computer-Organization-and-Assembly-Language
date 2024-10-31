.model small
.stack 100h
.386
.data
arr1 db 2 dup('$')
var1 db 0
str1 db "Enter a binary number up to 8 digits: $"
str2 db "The binary sum is :$"
.code
	main proc 
		mov ax,@data
		mov ds,ax
		mov si,offset arr1
		mov di,offset arr1
		
		mov ch,2
loop1:	mov bl,0b
		mov cl,8
again:	mov ah,01h
		int 21h
		
		cmp al,0Dh
		je binend
		
		sub al,48d
		
		shl bl,1
		or bl,al
		dec cl
		jnz again
		
binend: mov [si],bl
		inc si 
		dec ch
		jnz loop1
		
		
		
		mov cx,8
		
loop2:	mov bl,[di]
		
agai:	rol bl,1
		jc one
		
		mov dl,'0'
		jmp print
		
one:	mov dl,'1'

print:	mov ah,02h
		int 21h
		
		dec cx
		jnz agai
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		
		inc di
		inc var1
		cmp var1,2
		jne loop2
		
	mov ah,4ch
	int 21h
main endp
end main 