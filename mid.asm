;.model small
;.stack 100h
;.data
;A dw 2
;B dw 5
;sum dw ?
;.code
;	main proc
;		mov ax,@data
;		mov ds,ax
;		mov ax,A
;		add ax,B
;		mov sum,ax
;		
;		add ax,'0'
;		mov dl,al
;		mov ah,02h
;		int 21h
;
;	mov ah,4ch 
;	int 21h
;	
;main endp
;end main 



;the sum of 2 and 7 is 9
;.model small
;.stack 100h
;.data
;str1 db "The sum of $"
;str2 db " and $"
;str3 db " is : $"
;.code
;	main proc
;		mov ax,@data
;		mov ds,ax
;		
;		lea dx,str1
;		mov ah,09h
;		int 21h
;;		
;		mov ah,01h
;		int 21h
;		
;		mov bl,al
;		
;		lea dx,str2
;;		mov ah,09h
;		int 21h
;		
;		mov ah,01h
;;		int 21h
;		
;		lea dx,str3
;		mov ah,09h
;		int 21h
;		
;		
;		
;;		sub bl,30h
;		sub al,30h
		
;		add bl,al
;;		
;		add bl,30h
;		mov dl,bl
;		
;		mov ah,02h
;		int 21h
;		
;	mov ah,4ch
;	int 21h
;main endp
;end main


;Enter three initiated of a person : LKA

;.model small
;.stack 100h
;.data
;str1 db "Enter three initiated of a person : $"
;.code
;	main proc
;		
;		mov ax,@data
;		mov ds,ax
;		
;		lea dx,str1
;		mov ah,09h
;		int 21h
;		
;		
;;		mov ah,01h
;		int 21h
		
;		mov bl,al
;		
;		mov ah,01h
;		int 21h
;		
;		mov bh,al
;		
;		mov ah,01h
;		int 21h
;		mov cl,al
;		
;		mov dl,10
;		mov ah,02h
;		int 21h
;		mov dl,13
;		mov ah,02h
;		int 21h
;;		
;		mov dl,bl
;		mov ah,02h
;		int 21h
;		
;		mov dl,10
;		mov ah,02h
;		int 21h
;		mov dl,13
;		mov ah,02h
;		int 21h
		
		
;		mov dl,bh
;		mov ah,02h
;		int 21h
		
;		mov dl,10
;		mov ah,02h
;		int 21h
;		mov dl,13
;		mov ah,02h
;		int 21h
;		
;		mov dl,cl
;;		mov ah,02h
;		int 21h
;;		
;	mov ah,4ch
;	int 21h
;	
;main endp
;end main

.model small
.stack 100h
.386
.data
.code
	main proc
		mov ah,01h
		int 21h
		mov bl,al
		mov ah,01h
		int 21h
		mov bh,al
		mov ah,01h
		int 21h
		
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		mov ch,11
		
loop2:	cmp ch,7
		je str1
		mov cl,11
		
loop1:
		
		mov dl,'*'
		mov ah,02h
		int 21h
		
		dec cl
		jnz loop1
		jmp again
		
str1:	mov dl,'*'
		mov ah,02h
		int 21h
		mov dl,'*'
		mov ah,02h
		int 21h
		mov dl,'*'
		mov ah,02h
		int 21h	
		
		mov dl,' '
		mov ah,02h
		int 21h
		
		mov dl,bl
		mov ah,02h
		int 21h
		mov dl,bh
		mov ah,02h
		int 21h
		mov dl,al
		mov ah,02h
		int 21h
		
		mov dl,' '
		mov ah,02h
		int 21h
		
		mov dl,'*'
		mov ah,02h
		int 21h
		mov dl,'*'
		mov ah,02h
		int 21h
		mov dl,'*'
		mov ah,02h
		int 21h
		
again:		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		
		dec ch
		jnz loop2
		
		
	mov ah,4ch
	int 21h
main endp
end main



















