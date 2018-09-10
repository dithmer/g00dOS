; My GDT will have a very simple layout. Two overlapping segments for 32-Bit
; code and data segment in Ring0 (Highest Privileges).
gdt:
    ; GDT starts with 8 Byte NULL
    dd 0x0
    dd 0x0

; Code-Segment Description
gdt_code:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

; Data-Segment Description
gdt_data:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt - 1
    dd gdt

CODE_SEG equ gdt_code - gdt
DATA_SEG equ gdt_data - gdt

