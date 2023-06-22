[org 0x0100]

jmp start

Section .data
msg db  'enter number:    $'
msg1 db 'enter limit: $'
msg2 db 'Output here: $' ,0x0a ,
msg3 db 'wrong enter Again: $'
newline db 0x0a ,'$'

star db '*  $'

equal db '=   $'

num dd 0 , '$'
num1 dd 0 , '$'
num2 dd 49 , '$'
num3 dd 0 , '$'
 




printtable:
    mov dx , msg 
    mov ah , 9 
    int 21h 
    
    mov ah, 7
    int 21h
    mov byte[num], al
    
   

    mov dx , num
    mov ah , 9
    int 21h 
    
    mov dx , newline
    mov ah , 9 
    int 21h 

    mov dx , msg1 
    mov ah , 9 
    int 21h 
    
    mov ah , 7 
    int 21h 
    mov byte[num1] , al 
    
   
    mov dx , num1
    mov ah , 9
    int 21h 

    mov dx , newline 
    mov ah , 9 
    int 21h 
    
    
    mov dx , msg2
    mov ah , 9 
    int 21h 
    
    mov dx , newline 
    mov ah , 9 
    int 21h 

    mov cx , [num1]

     sub cx , 30h
    
    outputfunc:
        
        mov dx , num
        mov ah , 9 
        int 21h 
        
        mov dx , star
        mov ah , 9 
        int 21h 

        mov dx , num2
        mov ah , 9 
        int 21h

        
        mov dx , equal
        mov ah , 9 
        int 21h 


        mov ax , [num]
        mov bx , [num2]
        sub ax , 30h 
        sub bx , 30h 
        mul bx 

        cmp ax , 9 
        jg doubledigit

        add ax , 30h
        mov [num3] , ax
        
        
        mov dx , num3
        mov ah , 9 
        int 21h 
        point:
        mov dx , newline 
        mov ah , 9 
        int 21h 

        mov ax , [num2]
        sub ax , 30h 
        add ax , 1 
        add ax, 30h 
        mov [num2] , ax 

        loop outputfunc

    ret 

start:
    call printtable
    mov ah, 4ch
    int 21h

doubledigit:
    mov bl , 10 
    div bl
    push ax 
    add al , 30h 
    
    mov [num3] , al
    
    mov dx , num3
    mov ah , 9 
    int 21h 

    pop ax 

    add ah , 30h
    mov [num3] , ah

    mov dx , num3
    mov ah , 9 
    int 21h 

    jmp point

printchr:
    mov  cx, 1       
    mov  bx, 0007h   
    mov  ah, 09h    
    mov  al, 2ah
    int  10h
ret 


error:
    mov dx , msg1 
    mov ah , 9 
    int 21h 
    jmp printtable