.model small
.stack 100h
.data
str1 db "Enter first string : $"
str2 db "Enter second string : $"
str3 db "Yes it is substring : $"
str4 db "Not a substring : $"
arr1 db 100 dup("$")
arr2 db 100 dup("$")
arr3 db 2 dup(0)
.code 
	main proc
	
		mov ax,@data
		mov ds,ax
		mov es,ax
		lea di,arr1
		
		lea si,arr3
		
		lea dx,str1
		mov ah,09h
		int 21h
		
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
		
		
		
		mov al,0
		mov ah,-1
		
		lea si,arr1
		lea di,arr2
		
again2:
		mov bl,[si]
		mov bh,[di]
		
		inc ah
		cmp ah,cl
		je exit2
		
		cmp bl,bh
		jne count0
		inc al
		inc si
		inc di
		cmp al,ch
		je exit1
		
		
		jmp again2
		
count0:	mov al,0
		inc si
		jmp again2
exit1:	
		lea dx,str3
		mov ah,09h
		int 21h
		jmp finish

exit2:	
		cmp al,ch
		je exit1
		lea dx,str4
		mov ah,09h
		int 21h
finish:	
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