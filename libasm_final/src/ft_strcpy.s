; ----------------------------------------------------------------------------------------
; ft_strcpy in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_strcpy.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

section .text:
    global ft_strcpy

ft_strcpy:
    mov rax,0
    jmp copy

copy:
    cmp BYTE    [rsi + rax],0
    je          exit
    mov         rcx,[rsi + rax]
    mov         [rdi + rax],rcx
    inc         rax
    jmp         copy
exit:
    mov BYTE    [rdi + rax], 0
    mov         rax,rdi
    ret