section .text
    global Hidenp

Hidenp:
    init_hidenp:
        xor rcx, rcx
        xor r8, r8
        mov r8, [rdi + rcx]

    loop_cmp:
        cmp [rsi], r8b
        je inc_needle
        jmp inc_haystack

    inc_needle:
        inc rcx
        mov r8, [rdi + rcx]
        inc rsi
        jmp check_end

    inc_haystack:
        inc rsi
        jmp check_end

    check_end:
        cmp r8b, 0
        je end_success
        cmp byte[rsi], 0
        je end_failure
        jmp loop_cmp

    end_success:
        mov rax, 1
        ret

    end_failure:
        mov rax, 0
        ret
