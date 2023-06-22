org0x100


mov ax,[num1]    ;laod first number in ax 
mov bx,[num2]     ; mov [num1] ,[num2]
;illegal
add ax ,bx 
mov bx,[num3]
add ax,bx 
mov [num4],bx
mov ax,0x4c00
int 0x21

num1:dw 5    ;dw means defind word
num2:dw 10
num3: dw 15
num4: dw 0
