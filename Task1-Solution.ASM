[org 0x0100]

mov ax,2

mov bx,2

mov cx,10

tag1:

mul bx

sub cx,1

cmp ax,cx

jne tag1

mov ax,0x4c00

int 0x21