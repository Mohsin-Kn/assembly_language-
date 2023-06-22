org 100h
; Define constants
SECTION .data
    
    PROMPT_MSG db 0x0a,"Enter a number:$ "
    prompt db 0x0a,"here is your number :$ "
    newline db 0x0a,'$'
    num dd 0,'$'

; Define code
SECTION .text
    global _start

_start:
    ; Print prompt message
    mov ah, 0x09         ; Write a string function
    mov dx, PROMPT_MSG   ; Address of prompt message
    int 0x21             ; Call interrupt to write string

    ; Read in number
    mov ah, 7
   int 21h
    mov [num],al         ; Read a string function
    mov dx, num          ; Address of num
              ; Call interrupt to read string
     mov dx ,prompt
     mov ah,0x09
     int 21h
     mov dx,newline
     mov ah,9
    int 21h
    ; Print the number
    mov dx, num
    mov ah, 0x09         ; Write a string function
             ; Address of num
    int 0x21             ; Call interrupt to write string

    ; Exit program
    mov ah, 0x4C         ; Terminate program function
    int 0x21             ; Call interrupt to terminate program
