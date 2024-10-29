.model small
.stack 100h
.data
str1 db "Enter string 1 : $"
str2 db "Enter string 2 : $"
str3 db "Enter integer : $"
str4 db "New string is : $"
arr1 db 100 dup('$')
arr2 db 100 dup('$')
arr3 db 2 dup('$')
arr4 db 100 dup('$')
.code
	main proc
		
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		lea di,arr1
		
		lea si,arr3
		
		call input_str

	
		inc si
	
		lea dx,str2
		mov ah,09h
		int 21h
		lea di,arr2
		
		call input_str
		
		
		lea si,arr3
		mov cl,[si]
		inc si
		mov ch,[si]
		
		lea dx,str3
		mov ah,09h
		int 21h
		
		
		
		mov ah,01h
		int 21h
		
		sub al,48
		mov bl,al
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		lea si,arr2
		lea di, arr4
		inc ch
		mov bh,0
loop3:
		dec ch
		jz exit3
		mov al,[si]
		mov [di],al
		inc bh
		inc si
		inc di
		cmp bh,bl
		je exit3
		jmp loop3

exit3:	mov bh,0
		lea si,arr1
loop4:
		
		mov al,[si]
		mov [di],al
		inc si
		inc di
		inc bh
		cmp bh,cl
		jne loop4
		
		
		lea si,arr2
		mov bh,bl
		
incloop:
		inc si
		dec bl
		jnz incloop
		
		mov bl,bh
		
loop5:
		mov al,[si]
		mov [di],al
		inc si
		inc di
		inc bl
		cmp ch,bl
		jne loop5
		
		lea dx,arr4
		mov ah,09h
		int 21h
		
		
		
		
	mov ah,4ch
	int 21h
	
main endp

input_str proc
	
	mov cl,0
again:
	
	mov ah,01h
	int 21h
	
	cmp al,13
	je exit
	
	cld
	inc cl
	stosb
	jmp again
	
exit:
	mov [si],cl
	
	ret
	
input_str endp

end main 