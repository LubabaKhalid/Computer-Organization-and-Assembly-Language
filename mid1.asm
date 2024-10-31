

;Binary input and binary output


;.model small
;.stack 100h
;.386
;.data
;.code
;	main proc
;		
;		mov cx,8
;		mov bl,0h
;		
;again:	shl bl,1
;		mov ah,01h
;		int 21h
;		
;		sub al,30h
;		or bl,al
;		dec cx
;		jnz again
;		
;		mov dl,10
;		mov ah,02h
;		int 21h
;		mov dl,13
;		mov ah,02h
;		int 21h
;		
;		mov cx,8
;loop1:	rol bl,1
;		jc one
;		mov dl,'0'
;		jmp print
;		
;one:	mov dl,'1'
;print:	mov ah,02h
;		int 21h
;		
;		dec cx
;		jnz loop1
;		
;		
;	mov ah,4ch
;	int 21h
;main endp
;end main



;hexa input and hexa output




.model small
.stack 100h
.386
.data
.code
	main proc 
		mov cx,4
		mov bx,0h
		
again:	shl bx,4
		
		mov ah,01h
		int 21h
		
		cmp al,'9'
		jbe digit
		
		sub al,7h
digit:	sub al,30h
		
		or bl,al
		
		dec cx
		jnz again
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov cx , 4
loop2:	
		
		mov dl,bl
		ror bx ,4
		and dl,0fh
		cmp dl,9
		jbe digit1
		add dl,7h
digit1: add dl,30h
		mov ah,02h
		int 21h
		dec cx
		jnz loop2
		
		

	mov ah,4ch
	int 21h
main endp
end main 

;hexa to binary 
;.model small
;.stack 100h
;.386
;.data
;.code
;	main proc 
;		mov cx,2
;		mov bl,0h
;again:		shl bl,4
;		mov ah,01h
;		int 21h
;		
;		cmp al,'9'
;		jbe digit
;		sub al,7h
;digit:	sub al,30h
;		
;		or bl,al
;		dec cx
;		jnz again
;		
;		mov dl,10
;		mov ah,02h
;		int 21h
;		mov dl,13
;;		mov ah,02h
;		int 21h
;		
;		mov cx,8
;loop1:	rol bl,1
;		jc one
;		mov dl,'0'
;		jmp print
		
;one:	mov dl,'1'
;print:	mov ah,02h
;		int 21h
;		
;		dec cx
;		jnz loop1
		
		

;	mov ah,4ch
;	int 21h
;main endp
;end main 











