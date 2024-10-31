.model small
.stack 100h
.data
	newline db 10h,13h
.code
	main proc
	mov ah,01h
	int 21h
	
	mov dl,newline
	mov ah,02h
	int 21h
	
	mov dl,al
	mov ah ,02h
	int 21h
	
	mov dl,newline
	mov ah,02h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov dl,newline
	mov ah,02h
	int 21h
	
	mov dl,al
	mov ah ,02h
	int 21h
	
	
	
	mov ah,4ch
	int 21h
main endp
end main
	