# Bootloader

This is a simple bootloader which is booted via a legacy BIOS. The program is written in assembly language and a bootable binary is created. This bootable binary represents the boot sector of a disk and is recognized by the BIOS as a bootable image.


The program first switches to the protected mode (32-bits) and thereafter prints “Hello world!” and the contents of the CR0 register. The bootable image can be booted using [qemu](https://www.qemu.org/download/) emulator.
