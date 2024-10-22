.model small
.stack 100h
.data
arr1 db 100 dup('$')  
.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, arr1       
    mov cx, 0          

input_loop:
    mov ah, 01h        
    int 21h            
    cmp al, 13         
    je process_end

    cmp cx, 0          
    je store_char

    dec si             
    mov bl, [si]       

    inc si             
    cmp bl, al         
    je pop_char        

store_char:
    mov [si], al       
    inc si            
    inc cx            
    jmp input_loop     

pop_char:
    dec si             
    dec cx            
    jmp input_loop     

process_end:
    lea dx, arr1       
    mov ah, 09h        
    int 21h            

    mov ah, 4Ch        
    int 21h            

main endp
end main
