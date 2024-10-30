.model small
.stack 100h
.data
	str1 db "COAL is good $"
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov si,offset str1
	
	
	mov cx,0
	mov di,si
again:mov si,di
	
aa:	
	mov al,[si]
	
	cmp al,'$'
	je exit
	cmp al,' '
	je print
	
	inc si
	inc cx
	jmp aa
	
	
	
print:mov di,si
	inc di
	dec si
	
bb:	mov dl,[si]
	mov ah,02h
	int 21h
	
	dec si
	dec cx
	jnz bb
	
	mov dl,' '
	mov ah,02h
	int 21h
	
	inc si
	mov cx,0
	jmp again
	
exit:mov ah,4ch
	int 21h
main endp
end main
	