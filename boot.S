[bits 16]
[org 0x7c00]
xor ax, ax
mov ds, ax
mov es, ax

mov si, RM_INTRO_MESSAGE
call print_rm

call switch_to_pm

jmp $

%include "./include/print_rm.S"
%include "./include/gdt.S"
%include "./include/print_pm.S"
%include "./include/switch_to_pm.S"

[bits 32]
BEGIN_PM:
    mov ebx, PM_INTRO_MESSAGE
    call print_pm

    jmp $

RM_INTRO_MESSAGE db 'Starting bootloader in realmode...', 0x0
PM_INTRO_MESSAGE db 'Changed mode to protected mode...', 0x0

times 510 - ($ -$$) db 0
dw 0xaa55
