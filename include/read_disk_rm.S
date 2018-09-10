[bits 16]
read_disk:
    pusha
    
    xor ax, ax
    mov es, ax
    mov ds, ax

    mov ah, 0x02
    mov al, dh

    mov cl, 0x02
    mov ch, 0x00
    mov dh, 0x00

    int 13h
    jc disk_error

.end:
    popa
    ret

disk_error:
    mov si, RM_LOADING_KERNEL_ERR_MSG
    call print_rm
    jmp disk_loop

disk_loop:
    jmp $
