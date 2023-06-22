[org 0x0100]

mov ax,0x4D2

mov bx,0x38

add bh,al

jmp tag1

jmp tag2

sub ah,0xFF

tag1:

mov ax,0

tag2:

add ax,0xFFFF

ret
;mov ax,0x4c00

;int 0x21