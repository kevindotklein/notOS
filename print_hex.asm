;;; ascii 0-9 == hex 30-39
;;; ascii A-F == hex 41-46
;;; ascii a-f == hex 61-66

print_hex:
        pusha               ;push all regs onto the stack
        mov cx, 0           ;loop counter

hex_loop:
        cmp cx, 4           ;4 hex digits
        je end_hex

        mov ax, dx
        and ax, 0x000F      ;mask
        add al, 0x30
        cmp al, 0x39        ;last ascii numbers in hex
        jle move_into       ;<=
        add al, 0x7         

        ;;; 0xA = 10
        ;;; 'A' = 65
        ;;; 65 - 10 = 55
        ;;; 55 = 0x37

;move into bx to print as ascii
move_into:
        mov bx, hexString + 5   ;offset based on length
        sub bx, cx
        mov [bx], al
        ror dx, 4           ;rotate right 4 **bits** (i.e 0x12AB -> 0xB12A -> 0xAB12 -> 0x2AB1 -> 0x12AB)

        add cx, 1
        jmp hex_loop        


end_hex:
        mov bx, hexString
        call print_string
        popa
        ret

        ;data
hexString:      db '0x0000', 0