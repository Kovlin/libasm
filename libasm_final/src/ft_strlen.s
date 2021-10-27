; ----------------------------------------------------------------------------------------
; ft_strlen in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_strlen.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

section .text:
    global ft_strlen

ft_strlen:
    mov rax,0
    jmp calc_length

calc_length:
    cmp BYTE    [rdi + rax],0
    je          exit
    inc         rax
    jmp         calc_length

exit:
    ret