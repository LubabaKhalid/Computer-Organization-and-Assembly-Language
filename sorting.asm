.model small
.stack 100h
.data
arr1 db 50 dup('$')
var1 db 0
var2 db 0
.code
	main proc
		mov ax,@data
		mov ds,ax
		lea si,arr1
		
		mov cl,0
		
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		mov [si],al
		inc si
		inc cl
		
		jmp again 
		
exit:	
		
		
		
		lea si,arr1
		
		dec cl
		
outer_loop:
    mov var1, 0       
outer_loop_start:
    cmp var1, cl      
    je sorting_done
    
    lea si, arr1      
    lea di, arr1       
    
	mov ch,var1
    add si, ch      
    inc var1          
    
    mov var2, var1     

inner_loop_start:
    cmp var2, cl       
    je outer_loop_start

    mov al, [si]       
    mov bl, [si+1]     

    cmp al, bl         
    jbe inner_loop_next 
    
   
    xchg al, bl
    mov [si], al
    mov [si+1], bl

inner_loop_next:
    inc si             
    inc var2           
    jmp inner_loop_start

sorting_done:
    
    lea dx, arr1       
    mov ah, 09h
    int 21h            

		
		
		
	mov ah,4ch
	int 21h
	
main endp
end main