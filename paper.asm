[org 0x0100]

xor ax,ax

mov ax,11
mov [tag],ax

mov bx,3
mov [tag+2],bx

add ax,[tag+2]
mov [tag+4],ax

sub bx,3

mov ax,0x4c00
int 0x21

tag: db 0,1,2,3,5,9