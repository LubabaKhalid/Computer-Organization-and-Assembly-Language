.model small
.stack 100h
.data
str1 db 100 dup("$")
.code 
	main proc
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,str1
	
	
again:
	mov ah,01h
	int 21h
	
	cmp al,13
	je exit
	
	cld
	stosb
	jmp again
	
exit:	
	
	lea dx,str1
	mov ah,09h
	int 21h
	
	mov ah,4ch
	int 21h

main endp 
end main 

