org 100h

jmp start
data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:

; // Print a string on screen 


clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret
printstr:

    mov cx, msg1end - data ;		 calculate message size.
    ;mov  bx, 0001h    ; 		BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; 		fore and background color
    
    mov dh, 12         ; 	Row number 12
    mov dl , 15        ; 	Column No 15
    push cs                    ;
    pop es

    mov bp,  data
    mov ah , 13h      ; 	To print string on screen we use 13h function
    int  10h
  
    mov  ah, 00h      ; 	BIOS.WaitKeyboardKey
    int  16h          ;		 -> AX
ret 
setBorderColor:
;// Left side column
    MOV AH, 06h    ; Scroll up function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 3501H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
;// Right side column
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00
    mov cl, 78
    MOV DX, 2475H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
;// Top Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00h
    mov cl, 00h
    MOV DX, 0179H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX

;// Bottom Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 18h ; 24= 18 hex
    mov cl, 00h 
    MOV DX, 1879H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

start: 
call clrscr

call printstr
call setBorderColor

mov ax, 0x4c00 ; terminate program
int 0x21