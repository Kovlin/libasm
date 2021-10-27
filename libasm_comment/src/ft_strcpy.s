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
    mov rax,0   ; on initialise rax à 0 qui nous servira de compteur
                ; la destination se trouve dans RDI et la source dans RSI (conventions d'appel)
    jmp copy    ; on saute à la fonction de copie

copy:
    cmp BYTE    [rsi + rax],0       ; on compare la position actuelle dans la source et le caractère nul
    je          exit                ; on saute à la fonction de sortie si on est au bout de la source
    mov         rcx,[rsi + rax]     ; on place le caractère à copier dans un registre intermédiaire car on ne peut utiliser plus d'un opérande mémoire par instruction
    mov         [rdi + rax],rcx     ; on copie le caractère dans la destination
    inc         rax                 ; on incrémente rax de 1
    jmp         copy                ; on retourne au début de la fonction copy

exit:
    mov BYTE    [rdi + rax], 0      ; on force le \0 la fin de la destination
    mov         rax,rdi             ; la valeur de retour est contenue dans rax, on y met donc la chaîne destination
    ret                             ; met fin à la fonction, la valeur contenue dans rax est renvoyée par la fonction