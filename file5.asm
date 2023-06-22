[org 0x0100]

mov ax , 0
mov bx , num1
mov cx , 0
mov dx , 10
l1:
    
    mov cx  , [bx]
    add bx , 2
    cmp cx   , 0
    jnz l2

l2:
    add ax , cx 
    sub dx ,1

jnz l1

mov [result] , ax


mov ax , 0x4c00
int 0x21

num1:dw 2,0,0,0,7,0
result : dw 0
