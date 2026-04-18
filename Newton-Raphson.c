#include <stdio.h>

// Função recursiva Newton-Raphson conforme a regra do trabalho
int sqrt_nr(int x, int i) {
    // Caso base: se i = 0, retorna 1 
    if (i == 0) {
        return 1;
    } 
    
    // Caso recursivo: i > 0
    // A fórmula é: (sqrt_nr(x, i-1) + (x / sqrt_nr(x, i-1))) / 2
    int anterior = sqrt_nr(x, i - 1);
    return (anterior + (x / anterior)) / 2;
}

int main() {
    int x, i;

    // Cabeçalho 
    printf("Programa de Raiz Quadrada - Newton-Raphson\n");
    printf("Desenvolvedores: Gabriel Zanin e Maria Eduarda\n\n");

    // Laço de execução contínuo
    while (1) {
        printf("Digite os parametros x e i para calcular sqrt_nr(x,i) ou -1 para abortar a execucao: ");
        
        // Leitura dos valores
        if (scanf("%d", &x) == 1 && x < 0) break; // Aborta se x for negativo 
        if (scanf("%d", &i) == 1 && i < 0) break; // Aborta se i for negativo

        // Cálculo e exibição do resultado
        int resultado = sqrt_nr(x, i);
        printf("sqrt(%d,%d)=%d\n\n", x, i, resultado);
    }

    return 0;
}
