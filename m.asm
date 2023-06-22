[org 0x0100]

;xor ax,ax

mov bx,Tag1

mov cx,5

Tag3:

add ax,[bx]

add bx,2

loop Tag3

mov [Tag2],ax

mov ax,0x4c00
; exit

int 0x21

Tag1: dw 5, 10, 15

Tag2: dw 0