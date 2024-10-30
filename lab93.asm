.model small
.stack 100h
.data
str2 db "aeiouAEIOU$"
.code 
	main proc
	
	mov ax,@data
	
	mov ds,ax
	mov es,ax
	mov bx,0
again:
	mov ah,01h
	int 21h
	
	cmp al,13
	je exit
	
	lea di,str2
	mov cx,11
	repne scasb
	
	cmp cx,0
	je again
	
	inc bx
	jmp again
	
	
exit:	
	
	add bx,48
	mov dl,bl
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h

main endp 
end main