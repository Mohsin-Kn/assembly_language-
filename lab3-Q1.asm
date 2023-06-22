[org 0x0100]

;for (int i =3 ; i > 0 ; i++){
    ; result += data[i]

  mov ax, 0x8787 
  mov ax, 0    ;reset accumulator
  mov cx, 7    ; set iteration count
  mov bx, 0 ; set the base

  outerloop:
    add ax, [bx+Data]
    add bx, 2

    sub cx, 1

    jnz outerloop 

    mov [result], ax

    mov ax,0x4c00
    int 0x21

Data: dw 1,2,1,1,1,1,1
result : dw 0