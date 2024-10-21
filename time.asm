.model small
.stack 100h
.data
M1 db 10,13,'the time is $'
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		call indec
		mov dx,0
		mov bx,3600
		div bx
		push ax
		push dx
		
		mov ah,09h
		lea dx,M1
		int 21h
		
		pop dx
		pop ax
		
		call outdec
		push dx
		
		mov ah,02
		mov dl,':'
		int 21h
		
		pop ax
		mov bx,60
		mov dx,0
		div bx
		
		call outdec
		push dx
		
		mov ah,02
		mov dl,':'
		int 21h
		pop ax
		
		call outdec
		
		mov ah,4ch
		int 21h
		
main endp
end main 
		
		
		