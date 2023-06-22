org0x100


mov ax,[num1]    ;notice how we can do arithmeti here  
mov [num1+6],ax    ; also why +2 and not +1


mov ax,[num1+2]   
add [num1+6],ax

mov [num1+4]
add [num1+6],ax

mov ax,0x4c00
int 0x21

num1:dw 5 ,10,15,0
