.model small
.stack 100h
.data
	count db 0
.code
main proc
	mov cx,'0'
	mov ah,01h
	int 21h
	mov bl,al
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
aa:	mov dl,cl
	mov ah,02h
	int 21h
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	inc cx
	inc count 
	cmp cl,bl
	jbe aa
	mov ah,4ch
	int 21h
main endp
end main
	