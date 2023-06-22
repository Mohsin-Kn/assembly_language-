[org 0x0100]
mov ax,2
mov bx,2
mov cx,10

tag1:
cmp ax,cx
je tag2
mul bx
loopne tag1
tag2:
mov ax,0x4c00
int 0x21