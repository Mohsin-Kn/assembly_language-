org0x100


mov ax,[num1]    ;notice how we can do arithmeti here  
mov bx,[num1+2]     ; also why +2 and not +1

add ax ,bx 
mov bx,[num1+4]    
add ax,bx 
mov [num1+6],bx  ;;atore sum at num1+6
mov ax,0x4c00
int 0x21

num1:dw 5
num2:dw 10
num3: dw 15
num4: dw 0
