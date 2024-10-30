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
	
	
	
	mov si,dx
	mov cx,0
aa:	inc si
	inc cx
	mov al,[si]
	cmp al,'$'
	jne aa
	
bb:	dec si
	dec cx
	mov dl,[si]
	mov ah,02h
	int 21h
	jnz bb
	
	mov ah,4ch
	int 21h
main endp
end main
	