[org 0x0100]

xor ax,ax

xor bx,bx

xor cx,cx

mov ax,2

mov bx,1

mov cl,5

Tag1:

mul bl
mov dx,ax
inc bx
mov ax ,2
loop Tag1

mov ax,0x4c00
; exit

int 0x21