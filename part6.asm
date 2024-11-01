.model small
.stack 100h
.data
	str1 db "COAL is interesting subject $"
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov si,offset str1
	
	
	
	mov cx,1
	
ent:mov al,[si]
	inc si
	inc cx
    cmp al, 0Dh
	je bb
	cmp al,'$'
	je exit
	cmp al, 0Dh
	jne ent
	
	
	
bb:
	mov di,si
	dec di
	mov dl,[di]
	mov ah,02h
	int 21h
	dec cx
	jnz bb
	mov cx,1
	jmp ent
	
	
	
exit:mov ah,4ch
	int 21h
main endp
end main
	