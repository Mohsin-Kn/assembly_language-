[org 0x0100]

jmp start

    num:dw 1,9,0,0,6,0
 
    length:dw 6
    smaller:dw 0
    secondsmallest:dw 0

nextsmall:
    mov ax,[smaller]
    mov [secondsmallest],ax
    mov ax,[num+bx]
    mov [smaller],ax
    add bx,2
    sub cx,1
    jz terminate
    jnz compareloop
start:
    mov dx,9
    mov ax,[num]
    mov [smaller],ax
    mov bx,2
    mov cx,[length]
compareloop:
    cmp ax,[num+bx]
    jae nextsmall
    mov dx,[secondsmallest]
    cmp dx,[num+bx]
    jbe skip
    mov [secondsmallest],dx
    skip:
        add bx,2
        sub cx,1
        jnz compareloop
        jz terminate
terminate:
    mov ax,0x4c00
    int 0x21