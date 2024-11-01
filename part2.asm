.model small
.stack 100h
.data
	str1 db 'vError! Sum is greater than 9$'
	count db 0
.code
	main proc
	mov ax,@data
	
	mov ds,ax
	mov dx,offset str1
	
	mov ah ,01h
	int 21h
	
	mov bl,al
	
	mov ah ,01h
	int 21h
	
	add al,bl
	
	sub al,48
	
	cmp al,'9'
	ja er
	
	mov dl,al
	mov ah,02h
	int 21h
	jmp exit
er:	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	mov ah,09h
	int 21h
	
exit:mov ah,4ch
	int 21h
main endp
end main
	