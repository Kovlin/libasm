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
    mov rax,0   ; on utilisera rax comme index, on l'initialise donc à 0
    jmp compare ; on saute à la fonction de comparaison

compare:
    movzx r10,BYTE [rdi + rax]  ; on place le caractère actuel de la chaîne 1 dans le registre r10
    movzx r11,BYTE [rsi + rax]  ; on place le caractère actuel de la chaîne 2 dans le registre r11
                                ; ne fonctionne pas avec mov, il faut utiliser movzx,
                                ; movzx va placer la valeur du byte à l'adresse [rdi/rsi + rax]
                                ; et va ensuite remplir le reste du registre de 0, on évite ainsi
                                ; certaines erreurs possible les opérations de comparaison
    cmp r10,0                   ; on vérifie si on est en bout de chaîne 1
    je  substraction            ; si on est en bout de chaîne on saute à la fonction substraction
    cmp r11,0                   ; on vérifie si on est en bout de chaîne 2
    je  substraction            ; si on est en bout de chaîne on saute à la fonction substraction
    cmp r10,r11                 ; on compare le caractère actuel des deux chaînes
    jne substraction            ; si ils sont différents on saute à la fonction substraction
    inc rax                     ; on incrémente rax de 1
    jmp compare                 ; on saute au début de la fonction compare


substraction:
    cmp r10,r11     ; on compare r10 et r10
    jl  exit_low    ; on saute à la fonction exit_low si r10 < r11
    jg  exit_great  ; on saute à la fonction exit_great si r10 > r11
    je  exit_equal  ; on saute à la fonction exit_equal si r10 = r11

exit_low:
    mov rax,-1 ; si r10 < r11 la valeur de retour vaut -1, elle se trouve dans rax
    ret        ; met fin à la fonction, la valeur contenue dans rax est renvoyée par la fonction
exit_great:
    mov rax,1  ; si r10 > r11 la valeur de retour vaut -1, elle se trouve dans rax
    ret
exit_equal:
    mov rax,0  ; si r10 = r11 la valeur de retour vaut -1, elle se trouve dans rax
    ret