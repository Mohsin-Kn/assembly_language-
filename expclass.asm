[org 0x100]
jmp start

mov  cx ,10
clr:

mov dl,'a'
add cx,2
cmp cx,10
jnz clr

mov ah,0x2
int 0x21


start;
call clr

ret
mov ax,0x4C00

int 0x21