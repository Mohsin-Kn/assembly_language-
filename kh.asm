org 100h



                 ; Define the string variables
str1: db "mary", 0
str2: db "army", 0



                 
len1: equ $-str1
len2: equ $-str2


                 ; Define the anagram flag
is_anagram: equ 0


                 ; Define the main program label
main:

                  ; Check if the strings have the same length
    cmp len1, len2

    jne not_anagram

   
    mov byte[is_anagram], 1

    ; Loop through each character in the first string
    
    mov si, 0
    mov di, str1
    mov cx, len1
    loop1:

  
        mov al, [di+si]

        ; Check if the character exists in the second string
        push si
        push cx
        mov si, 0
        mov cx, len2
        loop2:
            cmp al, [str2+si]
            jne next_char
            mov al, 0
            jmp done_loop2

        next_char:
            inc si
        loop loop2

        done_loop2:
        pop cx
        pop si

       
        cmp al, 0
        jne not_anagram
        inc si
    loop loop1

    ; Print the result

    cmp is_anagram, 1
    je is_anagram_msg
    jmp not_anagram_msg

                 ; Define the is_anagram message label
is_anagram_msg:
    mov ah, 0x09
    mov dx, is_anagram_str
    int 0x21 
    jmp exit

                    ; Define the not_anagram message label
not_anagram_msg:
    mov ah, 0x09
    mov dx, not_anagram_str
    int 0x21
    jmp exit

                    ; Define the not_anagram label
not_anagram:
    jmp not_anagram_msg

              
exit:
    mov ah, 0x4c
    int 0x21

is_anagram_str: db "The strings are anagrams.", 0
not_anagram_str: db "The strings are not anagrams.", 0
