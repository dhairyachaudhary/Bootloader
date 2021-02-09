compile:
	nasm -o bootloader_2019035.bin bootloader_2019035.asm
	
run: compile
	qemu-system-x86_64 bootloader_2019035.bin