; ----------------------------------------------------------------------------------------
; ft_strdup in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_strdup.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

extern malloc
extern ft_strlen, ft_strcpy

section .text:
    global ft_strdup

ft_strdup:
    push    rdi
    call    ft_strlen
    inc     rax
    mov     rdi, rax
    call    malloc
    cmp     rax,0
    je      exit_error
    mov     rdi, rax
    pop     rsi
    call    ft_strcpy
    ret

exit_error:
    pop     rdi
    ret