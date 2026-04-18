# -------------------------------------------------------------------------
# Trabalho: Newton-Raphson Recursivo
# -------------------------------------------------------------------------

# MACROS
.macro imprimir_string(%str)
    .data
        mensagem: .asciiz %str
    .text
        li $v0, 4
        la $a0, mensagem
        syscall
.end_macro

.macro ler_inteiro
    li $v0, 5
    syscall
.end_macro

.data
    msg_cabecalho: .asciiz "\nPrograma de Raiz Quadrada - Newton-Raphson\nDesenvolvedores: Maria Eduarda e Gabriel Zanin\n"
    msg_input:     .asciiz "\nDigite x e i (ou negativo para sair): "
    msg_abre_p:    .asciiz "sqrt("
    msg_virgula:   .asciiz ","
    msg_fecha_p:   .asciiz ")="
    newline:       .asciiz "\n"

.text
.globl main

main:
    # Imprime cabe�alho
    li $v0, 4
    la $a0, msg_cabecalho
    syscall

loop:
    # Solicita entrada
    imprimir_string("\nDigite x: ")
    ler_inteiro
    move $s0, $v0        # $s0 = x
    bltz $s0, encerrar   # Se x < 0, encerra

    imprimir_string("Digite i: ")
    ler_inteiro
    move $s1, $v0        # $s1 = i
    bltz $s1, encerrar   # Se i < 0, encerra

    # Prepara argumentos para a fun��o recursiva
    move $a0, $s0        # arg0: x
    move $a1, $s1        # arg1: i
    jal sqrt_nr
    move $s2, $v0        # Salva resultado em $s2

    # Impress�o do resultado formatado: sqrt(x,i)=resultado
    li $v0, 4
    la $a0, msg_abre_p
    syscall
    
    li $v0, 1
    move $a0, $s0
    syscall
    
    li $v0, 4
    la $a0, msg_virgula
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall
    
    li $v0, 4
    la $a0, msg_fecha_p
    syscall
    
    li $v0, 1
    move $a0, $s2
    syscall

    j loop

# --- FUN��O RECURSIVA sqrt_nr(x, i) ---
# $a0 = x, $a1 = i
sqrt_nr:
    # Salvamento na Pilha
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $s0, 4($sp)
    sw $s1, 0($sp)

    move $s0, $a0        # s0 = x
    move $s1, $a1        # s1 = i

    # Caso Base: if (i == 0) return 1
    bne $s1, $zero, recursao
    li $v0, 1
    j fim_sqrt

recursao:
    # Chamada: anterior = sqrt_nr(x, i - 1)
    move $a0, $s0        # x continua o mesmo
    addi $a1, $s1, -1    # i - 1
    jal sqrt_nr
    
    # Agora $v0 cont�m 'anterior'
    # C�lculo: (anterior + (x / anterior)) / 2
    div $s0, $v0         # x / anterior
    mflo $t0             # $t0 = resultado da divis�o
    
    add $t1, $v0, $t0    # $t1 = anterior + (x / anterior)
    sra $v0, $t1, 1      # $v0 = $t1 / 2 (usando shift right para divis�o por 2)

fim_sqrt:
    # Restaura��o da Pilha
    lw $s1, 0($sp)
    lw $s0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

encerrar:
    imprimir_string("\nExecucao abortada.\n")
    li $v0, 10
    syscall
