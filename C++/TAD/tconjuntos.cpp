#include <iostream>
using namespace std;

const int MAX_SIZE = 20;

class TConjunto {
private:
    int elementos[MAX_SIZE];
    int tamanho;

public:
    TConjunto() : tamanho(0) {}

    void lerDados(int n) {
        if (n < 0 || n > MAX_SIZE) {
            cout << "Número de elementos deve estar entre 0 e " << MAX_SIZE << "." << endl;
            return;
        }

        cout << "Digite os elementos (inteiros): ";
        for (int i = 0; i < n; i++) {
            int elem;
            cin >> elem;
            adicionar(elem);
        }
    }

    void adicionar(int elem) {
        if (tamanho < MAX_SIZE) {
            if (!pertence(elem)) {
                elementos[tamanho] = elem;
                tamanho++;
                cout << "Elemento " << elem << " adicionado ao conjunto." << endl;
            } else {
                cout << "Elemento " << elem << " já está no conjunto." << endl;
            }
        } else {
            cout << "Conjunto cheio. Não é possível adicionar mais elementos." << endl;
        }
    }

    bool pertence(int elem) const {
        for (int i = 0; i < tamanho; i++) {
            if (elementos[i] == elem) {
                return true;
            }
        }
        return false;
    }

    TConjunto uniao(const TConjunto &outro) const {
        TConjunto resultado;
        for (int i = 0; i < tamanho; i++) {
            resultado.adicionar(elementos[i]);
        }
        for (int i = 0; i < outro.tamanho; i++) {
            resultado.adicionar(outro.elementos[i]);
        }
        return resultado;
    }

    TConjunto intersecao(const TConjunto &outro) const {
        TConjunto resultado;
        for (int i = 0; i < tamanho; i++) {
            if (outro.pertence(elementos[i])) {
                resultado.adicionar(elementos[i]);
            }
        }
        return resultado;
    }

    bool igual(const TConjunto &outro) const {
        if (tamanho != outro.tamanho) {
            return false;
        }
        for (int i = 0; i < tamanho; i++) {
            if (!outro.pertence(elementos[i])) {
                return false;
            }
        }
        return true;
    }

    void imprimir() const {
        cout << "{ ";
        for (int i = 0; i < tamanho; i++) {
            cout << elementos[i];
            if (i < tamanho - 1) {
                cout << ", ";
            }
        }
        cout << " }" << endl;
    }
};

int main() {
    TConjunto conjunto1, conjunto2;

    cout << "Ler dados do primeiro conjunto:" << endl;
    int n1;
    cout << "Digite o número de elementos (max " << MAX_SIZE << "): ";
    cin >> n1;
    conjunto1.lerDados(n1);

    cout << "Ler dados do segundo conjunto:" << endl;
    int n2;
    cout << "Digite o número de elementos (max " << MAX_SIZE << "): ";
    cin >> n2;
    conjunto2.lerDados(n2);

    cout << "Conjunto 1: ";
    conjunto1.imprimir();

    cout << "Conjunto 2: ";
    conjunto2.imprimir();

    TConjunto uniaoConjuntos = conjunto1.uniao(conjunto2);
    cout << "União dos conjuntos: ";
    uniaoConjuntos.imprimir();

    TConjunto intersecaoConjuntos = conjunto1.intersecao(conjunto2);
    cout << "Interseção dos conjuntos: ";
    intersecaoConjuntos.imprimir();

    if (conjunto1.igual(conjunto2)) {
        cout << "Os conjuntos são iguais." << endl;
    } else {
        cout << "Os conjuntos são diferentes." << endl;
    }

    return 0;
}