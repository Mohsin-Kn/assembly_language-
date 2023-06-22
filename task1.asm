[org 0x0100]

xor ax,ax 
xor bx,bx
mov bx,tag1
mov ax,[bx]
mov  dx,4
add ax,dx

mov ax,0x4c00
int 0x21

tag1: dw 2,1
