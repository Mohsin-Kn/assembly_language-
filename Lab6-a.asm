[org 0x0100]

jmp start

    num:dw 2,1,8,3,4,5,9,7
    ignore:dw 0
    length:dw 8
    max:dw 0
    secondmax:dw 0

nextlargest:
    mov ax,[max]
    mov [secondmax],ax
    mov ax,[num+bx]
    mov [max],ax
    add bx,2
    sub cx,1
    jz terminate
    jnz compareloop
start:
    mov dx,0
    mov ax,[num]
    mov [max],ax
    mov bx,2
    mov cx,[length]
compareloop:
    cmp ax,[num+bx]
    jnae nextlargest
    mov dx,[secondmax]
    cmp dx,[num+bx]
    ja skip
    mov [secondmax],dx
    skip:
        add bx,2
        sub cx,1
        jnz compareloop
        jz terminate
terminate:
    mov ax,0x4c00
    int 0x21