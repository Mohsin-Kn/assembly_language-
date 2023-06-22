.model small
.stack
.data
.code
cif1 db ?
cif2 db ?
cif3 db ?
cif4 db?
n1 db ?
n2 db?
n3 db ?
top db?
cic db 1
ac db 0
msg db "Type in the number: $"
msg2 db "Type in the limit: $"
msg3 db "RESULTS: $"
.startup
;Clear Screen
mov cx, 1h
mov ah, 00h
mov al, 03
int 10h
;Message
mov ah, 09h
lea dx, msg
int 21h
;Units
mov ah, 01h
int 21h
sub al, 30h
mov cif1, al
; Tens
mov ah, 01h
int 21h
sub al, 30h
mov cif2, al
; Hundreds
mov ah, 01h
int 21h
sub al, 30h
mov cif3, al
;Clear Screen 2
mov cx, 1h
mov ah, 00h
mov al, 03
int 10h
Message 2
mov ah, 09h
lea dx, msg2
int 21h
;Limit Input
Imov ah, 01h
int 21h
sub al, 30h
mov top, al
inc top
;Clear Screen 3
mov cx, 1h
mov ah, 00h
mov al, 03
int 10h
;Message 3
mov ah, 09h
lea dx, msg3
int 21h

start:
;New line
mov ah, 02h
mov dl, Oah
int 21h
mov ah, 02h
mov dl, Odh
int 21h.
;Data Load
mov ah, 02h
mov dl, cift
add d1, 30h
int 21h
mov ah, 02h
mov dl, cif2
add d1, 30h
int 21h.
mov ah, 02h
mov dl, cif3
add d1, 30h
int 21h
mov ah, 02h
mov dl, "*"
int 21h.
mov dl, cic
add d1, 30h
mov ah, 02h
int 21h
mov al, cl
mov cif4, al
Imov ah, 02h
mov dl, "="
int 21h
; Math
mov al, cic
mov bl, cif3
mul bl
mov ah, Oh
aam
mov n3, al
mov ac, ah
mov al, cic
mov bl, cif2
mul bl
mov ah, Oh
aam
mov ac, ah
mov n2, al
mov al, cic
mov bl, cifl
mul bl
Imov n1, al
mov bl, ac
add n1, bl
mov ah, 000h
mov al, n1
aam
mov n1, al.
mov ac, ah

;Result Printing
mov ah, 02h
mov dl, ac

add dl, 30h
int 21h
mov ah, 02h
mov dl, n1
add d1, 30h
int 21h
mov ah, 02h
mov dl, n2
add d1, 30h
int 21h
mov ah, 02h
mov dl, n3
add d1, 30h
int 21h
inc cic
mov al, cic
cmp al, top
jne start
je end
end:
.exit