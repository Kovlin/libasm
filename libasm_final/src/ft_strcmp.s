; ----------------------------------------------------------------------------------------
; ft_strcmp in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_strcmp.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

section .text:
    global ft_strcmp

ft_strcmp:
    mov rax,0
    jmp compare

compare:
    movzx r10,BYTE [rdi + rax]
    movzx r11,BYTE [rsi + rax]
    cmp r10,0
    je  substraction
    cmp r11,0
    je  substraction 
    cmp r10,r11
    jne substraction
    inc rax
    jmp compare

substraction:
    cmp r10,r11
    jl  exit_low
    jg  exit_great
    je  exit_equal

exit_low:
    mov rax,-1
    ret

exit_great:
    mov rax,1
    ret

exit_equal:
    mov rax,0
    ret