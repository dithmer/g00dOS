all: run

run: boot.bin
	qemu-system-x86_64 $<

boot.bin: boot.S
	nasm -f bin -o $@ $<
