bits 16
org 0x7c00

bootloader:
    mov ax, 0x2401
    int 0x15
    mov ax, 0x3
    int 0x10
    lgdt [gdt_pointer]
    mov eax, cr0 
    or eax,0x1
    mov cr0, eax
    jmp CODE_SEG:bootseg

%include "32BitGDT.asm"

CODE_SEG equ gdt_code-gdt_start
DATA_SEG equ gdt_data-gdt_start

bits 32
bootseg:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esi,hello
    mov edx, cr0
    mov ecx, 8
    mov ebx, 000B8000h

.prnt:
	lodsb		
	or al,al
	jz .regv
	or eax,0x0100
	mov word [ebx], ax
	add ebx,2
	jmp .prnt  

.regv:
    rol edx, 4
    mov eax, edx
    and eax, 15
    add eax, 00000130h
    cmp al, '9'
    jbe .nxt
    add eax, 7

.nxt:
    mov [ebx], ax
    add ebx, 2
    dec ecx
    jnz .regv

res:
    cli
    hlt
    jmp res

hello: db "Hello world    Reg. Value:",0

times 510 - ($-$$) db 1
dw 0xaa55