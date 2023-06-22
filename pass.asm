org 100h

SECTION .TEXT
jmp start
Section .data
msg db 0x0a , 'Enter user  name: $' 
msg1 db 0x0a,'Enter Password: $' 
msg2 db 'omer$' 
msg3 db 'meow$' 
msg4 db 'Incorrect! Try Again $' 
newline db 0x0a ,'$'
num dd 0 , '$'
msg5 db 0x0a ,'Enter a character (A - Z or a - z) :',0x0a,'$'
username db 5, 0
resb 5
passoword db 5, 0 
resb 5
char db 2, 0 
resb 2

Section .code
printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2

newlinefunction:
    mov dx , newline 
    mov ah , 9 
    int 21h 
    ret 
getArray:
    mov  dx, username     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    ret
getArray1:
    mov  dx, passoword    ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    ret
getchar:
    mov  dx, char   ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    ret
tryagain:
    mov dx , msg4 
    mov ah , 9 
    int 21h 
    jmp start

start:
    mov dx , msg 
    mov ah , 9 
    int 21h
    call getArray
    push ax 
    mov al , [username + 2]
    cmp al , 'o'
    jne tryagain
    mov al , [username + 3]
    cmp al , 'm'
    jne tryagain
    mov al , [username + 4]
    cmp al , 'e'
    jne tryagain
    mov al , [username + 5]
    cmp al , 'r'
    jne tryagain
    pop ax 
    
    mov dx , msg1
    mov ah , 9 
    int 21h 
    call getArray1

    passoword1:

    push ax 
    mov al , [passoword + 2]
    cmp al , 'm'
    jne tryagain
    mov al , [passoword+ 3]
    cmp al , 'e'
    jne tryagain
    mov al , [passoword + 4]
    cmp al , 'o'
    jne tryagain
    mov al , [passoword + 5]
    cmp al , 'w'
    jne tryagain
    pop ax
    charfunction:
    mov dx , msg5
    mov ah , 9 
    int 21h
    
    call getchar
    push ax 
    mov al , [char + 2]
    cmp al , 0x0d
    je exit 
    lc:
    cmp al , 0x60
    jng uc
    cmp al , 0x7b
    jnl uc 
    sub al , 0x20

    mov  cx, 1
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    int  10h
    jmp charfunction
    uc:
    add al , 0x20 
    mov  cx, 1       ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    int  10h
    jmp charfunction

    exit:
    mov ax, 0x4c00 ; terminate program
    int 0x21       ; ReplicationCount