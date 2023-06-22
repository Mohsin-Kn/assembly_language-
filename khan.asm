[org 0x0100]

        jmp start

num1: dw 1,9,0,0,6,0
result: dw 0

start:  mov ax,0
	mov bx,0
	mov cx,6
	mox dx,0

outerloop:
	     mov ax,[num1+bx]
	     cmp ax,[num1+bx+2]
	     jg innerloop
innerloop:
	     cmp ax,dx
	     jl conditionalloop
	
	     mov [result],ax
	     mov dx,[result]

conditionalloop:

	          add bx,2
	          sub cx,1
	          jnz outerloop


mov ax,0x4c00
int 0x21

