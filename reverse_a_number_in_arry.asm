;reverse a number e.g 9 8 7 6 5 4 3 2 1 

[org 0x100]
jmp start
element:dw 1,2,3,4,5,6,7,8,9
reverse:dw 0

reversefunction:
push ax 
push bx
push cx
push dx
push si

loop1:
mov dx ,[element + bx]
mov [element+bx], dx
mov [reverse] ,dx 
jmp loop2
loop2:
    mov bx , [reverse]
    jmp breakloop

breakloop:
add bx , 2
sub cx ,1
jne loop1

pop si 
pop dx
pop cx
pop bx
pop ax

ret

start:

mov ax ,element
mov cx , 9 

push ax 
push cx
call reversefunction


mov ax , 0x4c00
int 0x21
