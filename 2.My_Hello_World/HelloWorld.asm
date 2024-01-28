BITS 64

section .data
    stdout equ 1
    hello db 'Hello, World!', 0
    len_hello equ $ - hello

section .text
    global _start

_start:
