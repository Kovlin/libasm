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
    mov rax,0       ; on utilise rax qui permet de renvoyer une valeur lorsque ret est utilsé et on l'initialise à 0
                    ; il servira de longueur de la chaîne de caractère
    jmp calc_length ; on saute vers la fonction de calcul de la longueur

calc_length:
    cmp BYTE    [rdi + rax],0   ; on compare le premier octet de RDI (dans lequel est stcoké le premier paramètre
                                ; passé à la fonction) avec 0 pour verifier si la chaîne est terminée
    je          exit            ; si la comparaison précédente est une égalité on saute vers la fonction exit
    inc         rax             ; on incrémente rax de 1
    jmp         calc_length     ; on saute au début de calc_length (on "boucle" dessus)

exit:
    ret ; met fin à la fonction, la valeur contenue dans rax est renvoyée par la fonction