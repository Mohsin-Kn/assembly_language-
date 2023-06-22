[org 0x0100]

mov ax,0
mov cx,10
mov bx,0
outerloop:
 	add ax,[num1+bx]
	add bx,2
	add cx,1
        jnz outerloop

mov [result],ax

mov ax,0x4c00
int 0x21

num1:dw 1,2,3,4,5,1,2,3,4,5
result : dw 0
	