section .data
    newline db 10 ; caractère de nouvelle ligne '\n'
    success_msg db "1", newline
    failure_msg db "0", newline
    ptr_str_to_comp resq 1 ; pointeur sur la première chaîne à comparer

section .text
    global compare_strings

compare_strings:
    ; Initialise les pointeurs avec des valeurs directes (simulant des arguments passés depuis le programme C)
    mov rsi, rdi ; rsi = adresse de la première chaîne
    mov rdx, rdx ; rdx = adresse de la deuxième chaîne

compare_loop:
    ; Charge le caractère courant de la deuxième chaîne dans r8b
    mov al, [rdx]

    ; Compare le caractère courant avec celui pointé par ptr_str_to_comp
    cmp byte [rsi], al
    jne not_equal

    ; Incrémente ptr_str_to_comp
    inc rsi

    ; Incrémente le pointeur de la deuxième chaîne
    inc rdx

    ; Répète la boucle
    jmp compare_loop

not_equal:
    ; Si les caractères ne sont pas égaux, affiche "0\n"
    mov rdi, 1 ; file descriptor 1 (stdout)
    mov rax, 1 ; syscall number for sys_write
    mov rdx, 2 ; longueur du message
    mov rcx, failure_msg ; pointeur vers le message
    syscall

    ret