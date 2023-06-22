org 100h
jmp start
Section .data
msg: db 'Enter a number:  $'
num: dw 0 , '$'

Section .code

printf:
    push bp;
    mov bp, sp;
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;
ret 2

scanchr:
    ; Take Input
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov [num] ,al
    ; print the entered character
    mov dx, num 
    mov ah, 9
    int 21h


ret 2

scanString:
    ; Take Input
  
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+1] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+2] ,al

    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+3] ,al

    ; print the entered number
    mov dx, num 
    mov ah, 9
    int 21h
  

ret 2
Numbers:
    push bp
    mov bp, sp
    push cx
    push si
    
    mov cx, [bp + 4]            
    clean:
        mov word [si], 0
        add si, 2
        loop clean
    pop si
    pop cx
    pop bp
    ret 2
;SubRoutine for calculating fib_sequence
calculate_fib:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push si

    cmp cx, 1
    ja add_prev
        ;else
        mov [si], cx
        add si, 2
        cmp cx, [bp + 4]
        jne call_func
            ;else
            pop si
            pop cx
            pop bx
            pop ax
            pop bp
            ret 2
    add_prev:
        mov bx, [si - 2]
        add bx, [si - 4]
        mov [si], bx

        add si, 2
        cmp cx, [bp + 4]
        jne call_func
            ;else
            pop si
            pop cx
            pop bx
            pop ax
            pop bp
            ret 2
    call_func:
        inc cx
        push word [bp + 4]
        call calculate_fib
        ;exit
        pop si
        pop cx
        pop bx
        pop ax
        pop bp
        ret 2

start:

mov ax, msg
push ax
push word[num]
mov si , fib_seq
call numbers
xor cx , cx 
push word[num]
call calculate_fib
call printf
call scanString

mov ah, 4ch             ;; end of program
int 21h