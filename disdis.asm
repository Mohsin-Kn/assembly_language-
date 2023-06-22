org 0x0100

clearscr:
push ax
push es
push di

	mov ax,0x8b00
	mov es,ax
	mov di,300
	print:
		mov word[es:di],0x7424
		add di,2
		cmp di,4000
		jne print

pop es
pop ax
pop di

ret

start:
call clearscr

mov ax,0x4c00
int 0x21