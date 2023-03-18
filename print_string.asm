print_string:
        pusha                   ;push all regs onto the stack
        mov ah, 0x0e
print_char:
        mov al, [bx]
        cmp al, 0
        je end_print
        int 0x10                ;bios interrupt
        add bx, 1
        jmp print_char
end_print:
        popa
        ret