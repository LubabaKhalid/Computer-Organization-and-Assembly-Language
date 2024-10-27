.model small
.stack 100h
.data
	str1 db 100 dup('$')
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov si,offset str1
	mov cx,1
	
ent:mov ah, 01h          
    int 21h
	mov [si],al
	
	inc si
	inc cx
    cmp al, 0Dh
	jne ent
	
bb:mov dl,[si]
	mov ah,02h
	int 21h
	dec si
	dec cx
	jnz bb
	
	
	
	mov ah,4ch
	int 21h
main endp
end main
	