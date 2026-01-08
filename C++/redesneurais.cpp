#include <iostream>
#include <cmath>

using namespace std;

const int NEURONIOS = 4;
const int PADROES = 10;

double cosseno(int a[], int b[]) {
    double produto = 0, normaA = 0, normaB = 0;

    for (int i = 0; i < NEURONIOS; i++) {
        produto += a[i] * b[i];
        normaA += a[i] * a[i];
        normaB += b[i] * b[i];
    }

    return produto / (sqrt(normaA) * sqrt(normaB));
}

void recuperar(int W[][NEURONIOS], int x[]) {
    int x_linha[NEURONIOS] = {0};

    for (int i = 0; i < NEURONIOS; i++) {
        for (int j = 0; j < NEURONIOS; j++) {
            x_linha[i] += W[i][j] * x[j];
        }
    }

    cout << "Vetor recuperado x': ";
    for (int i = 0; i < NEURONIOS; i++) {
        cout << x_linha[i] << " ";
    }

    cout << "\nCosseno: " << cosseno(x, x_linha) << endl;
}

int main() {

    int X[PADROES][NEURONIOS] = {
        { 1,  1,  1, -1},
        {-1, -1,  1, -1},
        {-1, -1, -1, -1},
        { 1, -1, -1,  1},
        {-1,  1, -1, -1},
        { 1, -1,  1,  1},
        { 1,  1,  1,  1},
        {-1, -1, -1,  1},
        {-1,  1,  1, -1},
        { 1,  1, -1,  1}
    };

    int W[NEURONIOS][NEURONIOS] = {0};

    for (int p = 0; p < PADROES; p++) {
        for (int i = 0; i < NEURONIOS; i++) {
            for (int j = 0; j < NEURONIOS; j++) {
                W[i][j] += X[p][i] * X[p][j];
            }
        }
    }

    cout << "\nPADRAO FAMILIAR\n";
    int familiar[NEURONIOS] = {1, 1, 1, -1};
    recuperar(W, familiar);

    cout << "\nPADRAO INCOMPLETO\n";
    int incompleto[NEURONIOS] = {1, 1, 0, -1};
    recuperar(W, incompleto);

    cout << "\nPADRAO PARECIDO\n";
    int parecido[NEURONIOS] = {1, 1, -1, -1};
    recuperar(W, parecido);

    return 0;
}

