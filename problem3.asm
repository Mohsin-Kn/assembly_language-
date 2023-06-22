org 100h

section .data
    ; Define the prompt message that will be displayed to the user.
    prompt db 0x0a , "Enter the number of rows: $ "

                                  ; Define the alphabet that will be used to print the triangle.
    alphabet db "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

     ;newline after every row
    newline db 0x0a ,'$'  ;10


    ; Define a variable to hold the number of rows entered by the user.
    num_rows resb 9

   ;section .text
jmp start

start:
                        ; Display the prompt message.
    mov ah, 0x09
    mov dx, prompt
    int 0x21

                       ; Read the number of rows entered by the user.
    mov ah, 0x0a
    mov dx, num_rows
    int 0x21

                       ; Convert the entered number from ASCII to binary.
    mov ah, 0x00
    mov al, [num_rows]
    sub al, 30h
    mov [num_rows], al

    ; Print the triangle of alphabets.
    mov ah, 0x09
    mov cx, [num_rows]
    mov si, alphabet

print_triangle:
    ; Print the current row of the triangle.
    mov bx, cx
    mov dx, si
    int 0x21

    ; Move to the next row of the triangle.
    dec cx
    add si, bx

    ; Add a newline character after each row.
    mov dx, newline
    int 0x21

    ; Repeat until all rows of the triangle have been printed.
    cmp cx, 0
    jg print_triangle

    ; Exit the program.
    mov ah, 0x4c
    mov al, 0x00
    int 0x21
