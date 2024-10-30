.model small
.stack 100h
.data
str1 db "Lubaba$"
str2 db 7 dup("$")
.code 
	main proc
	
	mov ax,@data
	mov ds,ax
	lea si ,str1
	
	mov es,ax
	lea di,str2
	
	mov cx,6
	
	cld
	rep movsb
	
	lea dx,str2
	mov ah,09h
	int 21h
	
	mov ah,4ch
	int 21h

main endp 
end main 

