[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_pm:
    pusha
    mov edx, VIDEO_MEMORY

.loop
    mov al, [ebx]
    cmp al, 0
    je .end

    mov ah, WHITE_ON_BLACK 
    mov [edx], ax

    add ebx, 1
    add edx, 2

    jmp .loop

.end:
    popa
    ret
