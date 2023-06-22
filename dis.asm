[org 0x0100]


clrscrn;

	mov ah,06h
	xor al,al
	xor cx,cx
	;mov ch,10
	;mov cl,10

	;mov dx,184fh
	mov dh,24
	mov dl,79  
	mov dh,24 

	mov bh,00h
	int 10h

ret
                      

start:

call clrscrn

mov ax,0x4c00
int 0x21n