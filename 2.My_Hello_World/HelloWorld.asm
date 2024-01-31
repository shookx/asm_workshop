BITS 64

section .data
    stdout equ 1
    hello db 'Hello, World!', 0
    len_hello equ $ - hello

section .text
    global _start

_start:
	mov rsi ,hello
	mov rdi ,1
	mov rax ,4
	mov rdx ,len_hello
	mov ebx, 0
	mov eax, 1
	syscall

	int 0x80
	mov ebx, 0
	mov eax, 1
	int 0x80
