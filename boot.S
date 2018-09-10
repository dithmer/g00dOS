[bits 16]
[org 0x7c00]
xor ax, ax
mov ss, ax
mov sp, 0x9000

KERNEL_OFFSET equ 0x1000
mov [BOOT_DRIVE], dl

call load_kernel
call switch_to_pm

jmp $

%include "./include/print_rm.S"
%include "./include/gdt.S"
%include "./include/print_pm.S"
%include "./include/switch_to_pm.S"
%include "./include/read_disk_rm.S"

[bits 16]
load_kernel:
    mov si, RM_LOADING_KERNEL_MESSAGE
    call print_rm

    mov bx, KERNEL_OFFSET
    mov dh, 1 
    mov dl, [BOOT_DRIVE]
    call read_disk
    ret


[bits 32]
BEGIN_PM:
    mov ebx, PM_INTRO_MESSAGE
    call print_pm

    call KERNEL_OFFSET
    jmp $

RM_LOADING_KERNEL_MESSAGE db 0x0a, 0x0d, 'Loading Kernel to 0x1000...', 0x0
RM_LOADING_KERNEL_ERR_MSG db 0x0a, 0x0d, 'Error while loading Kernel...', 0x0
PM_INTRO_MESSAGE db 'Changed mode to protected mode...', 0x0
BOOT_DRIVE db 0

times 510 - ($ - $$) db 0
dw 0xaa55
