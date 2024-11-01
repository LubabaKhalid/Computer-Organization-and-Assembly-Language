.model small
.stack 100h
.data
	str1 db 100 dup('$')
	str2 db 100 dup('$')
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov si,offset str1
	
	mov di,offset str2
	
	mov cx,1
	
ent:mov ah, 01h          
    int 21h
	mov [si],al
	
	inc si
	inc cx
	
    cmp al, 0Dh
	jne ent
	
	cmp al,'$'
	je exit
	
	mov bx,si

bb:mov al,[bx]
	mov [di],al
	inc di
	dec bx
	dec cx
	jnz bb
	jz ent
	
exit:
	mov dx,offset str2
	mov ah,09h
	int 21h
	
	mov ah,4ch
	int 21h
main endp
end main
	