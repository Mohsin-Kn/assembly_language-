[org 0x100]

jmp start 

data:   dw  2, 2, 1, 2 ,4 ,3, 1,3,3,4
size:  dw 10
mode1: dw 0
                
calculateMode:
	
	mov bx, 0
l3:

	add bx ,2

l1:
	mov ax ,[data+bx]
l2:
	cmp ax ,[data+bx +2]
	je mode
	add bx,2
	cmp bx , 20
	je l3
	jne l2

mode:
	add cx , 1
	cmp cx,7
	jnz l1

exit:
mov [mode1] , cx 

ret


start:

	call calculateMode

    mov ax, 0x4c00
    int 0x21
