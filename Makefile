all: run

run: os-image.bin
	qemu-system-x86_64 -fda $<

os-image.bin: boot.bin kernel.bin
	cat $^ > $@

boot.bin: boot.S ./include/*.S
	nasm -f bin -o $@ $<

kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 --oformat binary $^

kernel_entry.o: kernel.S
	nasm -f elf -o $@ $<

kernel.o: kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

clean:
	rm *.bin *.o 
