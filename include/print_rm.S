[bits 16]
; Print function uses SI and lodsb to print a null terminated string.
print_rm:
    mov ah, 0x0e

.loop:
    lodsb
    cmp al, 0
    je .end
    int 10h
    jmp .loop

.end:
    ret
