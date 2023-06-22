org 100h

section.data
jmp start
msg1 db 0x0a,'enter number here : S'
msg2 db 0x0a,'This is an even number: $'
msg3 db 0x0a, 'This is an odd number: $'
msg4 db "This is a Prime Number$"
msg5 db "This is not a Prime Number$"


mov ah,9
MOV dx,msg
int 21h

;endm

section .code


start:
mov ax,data
mov ds,ax
mov dx, msg1
mov ah,1
int 21h

mov ah,0
check:

 mov dl,2
 div di
 cmp ah,0
 jne odd
even:

mov dx,msg2
jmp done


odd:
mov dx, msg3

done:

start:

mov ax,data
mov ds,ax
mov al,num
mov bl,02H ; The Dividing starts from 2, Hence BH is compare to 02H

mov dx,0000H 
mov ah,00H 

level:

div bl
cmp ah,00H;
jne next
inc bh ;    BH is incremented if the Number is divisible by current value of BL

next:

cmp bh,02H   
je false		 ; The no is not a Prime No
inc bl  		; Increment BL
mov ax,0000H ; 

mov dx,0000H ;  
mov al,num ;  
cmp bl,num;  
jne level   ; To display The given no is a Prime No

true:  

mov dx,msg4

mov ah,09H;   Used to print a string
int 21H
jmp exit   ;To display The given no is not a Prime No

false:

mov dx,msg5
mov ah,09H;
int 21H

exit:

mov Ah,4CH
int 21H

