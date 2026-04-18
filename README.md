# Newton-Raphson_Assembly
Implementação recursiva do método de Newton-Raphson para cálculo de raiz quadrada em Assembly MIPS. Projeto desenvolvido para a disciplina de OAP na PUCRS

# Newton-Raphson em Assembly MIPS

Este projeto consiste na implementação de uma função recursiva para calcular a raiz quadrada de números inteiros positivos utilizando o método de Newton-Raphson.

## 📋 Sobre o Projeto
O trabalho foi desenvolvido para a disciplina de **Organização e Arquitetura de Processadores** da **PUCRS**. O objetivo principal é converter um algoritmo de alto nível (Linguagem C) para linguagem de montagem (Assembly MIPS), focando no uso de:
* Funções recursivas.
* Gerenciamento de pilha (Stack) para salvamento de registradores.
* Criação e uso de macros.

## 🛠️ Requisitos
* Simulador **MARS (MIPS Assembler and Runtime Simulator)**.

## 🚀 Como Executar
1. Abra o arquivo `newton_raphson.asm` no MARS.
2. Monte o código (F3).
3. Execute (F5) e insira os valores de `x` (número) e `i` (iterações) no console.

## 📊 Resultados Esperados
Conforme a especificação do trabalho:
- `sqrt_nr(100, 3) = 14`
- `sqrt_nr(100, 5) = 10`

