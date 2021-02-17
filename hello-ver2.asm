; ----------------------------------------------------------------------------------------
; It is 64 bit version, run on Linux only 
; Original code: https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm 
; To assemble and run:
;
;     nasm -felf hello-ver2.asm && ld -m elf_i386 -s -o hello-ver2.out hello-ver2.o && ./hello-ver2.out
; To disassemble:
;     ndisasm -e -b 32 hello-ver2.out
; Or you can generate listing files instead
; Source: https://stackoverflow.com/a/44841942/10671200
; ----------------------------------------------------------------------------------------

section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg     ;length of the string
