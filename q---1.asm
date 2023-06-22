[org 100h]

section .data

array1: db 0x0a , 'Enter first array: $'
array1_len: equ $-array1

array2: db 0x0a ,'Enter second array: $'
array2_len: equ $-array2

array3: db 0x0a,'unique elements are here :$ '
array3_len: equ $-array3



arr1_input: resb 100
arr2_input: resb 100
arr3_output: resb 100

section .text

jmp start

start:
    ; Print prompt for first array
    mov ah, 0x09
    mov dx, array1
    int 0x21

    ; Read input for first array
    mov ah, 0x0a
    mov dx, arr1_input
    int 0x21

    ; Print prompt for second array
    mov ah, 0x09
    mov dx, array2
    int 0x21

    ; Read input for second array
    mov ah, 0x0a
    mov dx, arr2_input
    int 0x21

                                                     ; Find unique elements  of the two arrays
    mov si, arr1_input  
    mov di, arr2_input  
    mov cx, 100           ;  length of both arrays
    mov bx, 0             ;  index of output array

    find:
        
 			 ; Check if characters in both arrays match
        cmp [si], [di]
        je next_char

       			 ; If they match, add character to output array

        mov al, [si]
        mov [arr3_output+bx], al
        inc bx

next_char:

    inc si
    inc di
    loop find

    
			; Print output array
    mov ah, 0x09
    mov dx, array3
    int 0x21

   

    mov ah, 0x09
    mov dx, arr3_output
    int 0x21

    
    mov ah, 0x4c
    int 0x21
