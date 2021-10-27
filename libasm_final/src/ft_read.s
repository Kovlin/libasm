; ----------------------------------------------------------------------------------------
; ft_read in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_read.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

extern __errno_location

section .text:
    global ft_read

ft_read:
    mov rax,0
    syscall
    cmp rax,0
    jl  exit_error
    ret

exit_error:
    neg     rax
    push    rax
    call    __errno_location
    pop     QWORD   [rax]
    mov     rax,-1
    ret