[bits 16]
[org 0x7c00]
xor ax, ax
mov ds, ax
mov es, ax

mov si, RM_INTRO_MESSAGE
call print_rm

jmp $

%include "./include/print_rm.S"
%include "./include/gdt.S"
%include "./include/print_pm.S"

RM_INTRO_MESSAGE db 'Starting bootloader in realmode...', 0x0

times 510 - ($ -$$) db 0
dw 0xaa55
