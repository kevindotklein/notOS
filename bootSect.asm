;;; boot sector

        org 0x7c00              ; set the origin

        ;clear screen
        mov ah, 0x00            ;video mode
        mov al, 0x03            ;80x25 text mode
        int 0x10

        mov ah, 0x0b
        mov bh, 0x00
        mov bl, 0x01            ;blue
        int 0x10

        mov bx, testString

        call print_string

        mov bx, anotherTestString
        call print_string

        mov dx, 0x12AB
        call print_hex

        ;end pgm
        jmp $

        ;includes (fasm format)
        include 'print_string.asm'
        include 'print_hex.asm'


testString:         db 'char test: testing ', 0xa, 0xd, 0
anotherTestString:  db 'hex test ', 0


        times 510-($-$$) db 0

        dw 0xaa55