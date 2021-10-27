; ----------------------------------------------------------------------------------------
; ft_strdup in Assembly x86_64 | Works for Linux
; To assemble :
;
;     nasm -felf64 ft_strdup.s
;     By rlinkov@student.s19.be
; ----------------------------------------------------------------------------------------

extern malloc                   ; on va utiliser la fonction C "malloc"
                                ; void *malloc(size_t size)
extern ft_strlen, ft_strcpy     ; ft_strlen et ft_strlcpy réalisées pour ce projet

section .text:
    global ft_strdup

ft_strdup:
    push    rdi         ; on push rdi sur la stack pour la sauvegarder, c'est notre string à copier
    call    ft_strlen   ; rdi contenant déjà notre string à copier on peut appeler ft_strlen
                        ; on a maintenant la longueur de s1 dans RAX
    inc     rax         ; on augmente rax de 1 pour le \0 à la fin
    mov     rdi, rax    ; on place cette valeur dans RDI car c'est le paramètre de la fonction malloc
    call    malloc      ; la fonction malloc renvoie dans rax un pointeur vers un espace mémoire de bonne taille
    cmp     rax,0       ; on vérifie que le malloc à fonctionné
    je      exit_error  ; on saute à la sortie erreur si le malloc n'as pas fonctionné
    mov     rdi, rax    ; on met ce pointeur (la destination) en premier paramètre de ft_strcpy
    pop     rsi         ; on pop la valeur de rdi push au début dans rsi qui est le second paramètre de ft_strcpy
                        ; (la source)
    call    ft_strcpy   ; on appelle ft_strcpy qui va copier la source dans la destination
                        ; la nouvelle chaîne est stockée dans RAX
    ret                 ; on retourne a la fonction d'appelle

exit_error:
    pop     rdi         ; on enlève la string push sur la stack
    ret                 ; on retourne dans la fonction d'appel