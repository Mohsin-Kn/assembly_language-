[org 0x0100]

mov al,1

mov bl,2

mov cl,5

Tag1:

add al,bl

cmp al,5

loopz Tag1

Mov ax,0xFFFF

mov ax,0x4c00
; exit

int 0x21