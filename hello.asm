.model small
.stack 100h
.data
	str1 db "hello world$"
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov dx,offset str1
		mov ah,09h
		int 21h
	mov ah,4ch
	int 21h
main endp
end main