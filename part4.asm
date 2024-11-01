.model small
.stack 100h
.data
	str1 db "PUCIT$"
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov cx,5
	mov dx,offset str1
	
	mov ah,09h
	int 21h
	
	mov bx,dx
aa:	mov dl,bl
	and dl,0fh
	add dl,37h
	
	mov ah,02h
	int 21h
	shr bx,4
	inc cx
	jnz aa
	
	
	mov ah,4ch
	int 21h
main endp
end main
	