section .text

[org 0x0100]

main:
    call clearscreen

    mov  dx, prompt1
    call prtstring
    call getArray
    call goToNewLine

    mov  dx, prompt2
    call prtstring
    call printArray
    call goToNewLine

    mov  dx, prompt3
    call prtstring
    call getIndex
    call goToNewLine

    mov  dx, prompt4
    call prtstring
    call getIndex
    call goToNewLine
    call printIndex


done:
    mov  al, 0          ; return code
    mov  ah, 0x4c       ; Alternatively:  "mov ax, 0x4c00"
    int  0x21


clearscreen:
    MOV AH, 07h
    XOR AL, AL
    XOR CX, CX
    MOV DX, 184FH
    MOV BH, 07h
    INT 10H
ret

getIndex:
    mov  dx, index
    mov  ah, 0x0a
    int  0x21
    mov  al, [index+2]
    ret

getArray:
    mov  dx, answer     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    mov  al, [answer+2] ; al <-- 3rd position/1st character of buffer
    ret

prtstring:
    mov  ah, 9          ; DOS print-string function
    int  0x21
    ret

goToNewLine:
	mov dx, newLine
	mov  ah, 9          ; DOS print-string function
	int  0x21
    ret

printArray:
    mov cx,0;
    mov cl, [answer+1]; calculate message size.
    mov al, 1    
    mov bh, 0
    mov bl, 07
    
    mov dh, 24         ; Row number 12
    mov dl , 0        ; Column No 20
    push cs
    pop es
    mov bp,  answer+2
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h

    mov  ah, 00h
    int  16h
ret

printIndex:
    mov cx,0;
    mov cl, 4; calculate message size.
    mov al, 1    
    mov bh, 0
    mov bl, 07
    
    mov dh, 24         ; Row number 12
    mov dl , 0        ; Column No 20
    push cs
    pop es
    mov bp,  answer+3
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h

    mov  ah, 00h
    int  16h
ret

    section .data
prompt1  db "Enter string: ", 0x0d, 0x0a, '$'
newLine db 0x0a, '$'

prompt2  db "Entered string is ", 0x0d, 0x0a, '$'

prompt3  db "Start Index: ", 0x0d, 0x0a, '$'

prompt4  db "Stop Index: ", 0x0d, 0x0a, '$'

answer  db 20, 0
resb 20

index  db 20, 0
resb 20