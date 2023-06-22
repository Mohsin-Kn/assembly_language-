org 0x100

mov ax,5
mov bx,10
push ax
push bx
pop ax 
pop bx 
mov ax,0x4c00
int 0x21