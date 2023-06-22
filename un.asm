[org 0x0100]

mov ax,2

mov bx,2

mov cx,4

tag1:

add ax,2

sub ax,bx

loop tag1

mov ax,0x4c00

int 0x21