mov ah, 0x0e
mov al, 'H'
int 10h

jmp $

times 510 - ($ -$$) db 0
dw 0xaa55
