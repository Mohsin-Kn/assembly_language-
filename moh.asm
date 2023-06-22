org 100h

; Define the strings
str1 db 'hello', 0 ; Null-terminated string
str2 db 'olelh', 0 ;

; Define some variables

str1_len equ $-str1 ; Length of str1
str2_len equ $-str2 ; Length of str2


max_len equ str1_len ;                          Maximum length of the two strings

; Check if the strings are anagrams

cmp str1_len, str2_len                ;                                            Compare the lengths of the strings
jne not_anagram ;                                                     Jump to not_anagram if they are not equal

; Initialize some registers
mov si, 0 ; Initialize the index register
mov cx, max_len ; Initialize the loop counter

; Loop through each character in the strings
check_loop:

    mov al, [str1+si] ; Load the current character from str1
    mov bl, [str2+si] ; Load the current character from str2

    cmp al, bl ; Compare the characters

    jne not_anagram ;            Jump to not_anagram if they are not equal
    inc si ;                     Increment the index
    loop check_loop ;            Loop until cx is 0

  ; The strings are anagrams
mov ax, 1
jmp done

; The strings are not anagrams
not_anagram:
    mov ax, 0

; Done
done:

mov ax,0x4c00
int 0x21
