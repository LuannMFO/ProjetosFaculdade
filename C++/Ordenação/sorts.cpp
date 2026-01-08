#include <iostream>
#include <vector>
using namespace std;

void printVector(const vector<int>& v) {
    for (int x : v) cout << x << " ";
    cout << endl;
}

void bubbleSort(vector<int> v) {
    for (int i = 0; i < v.size(); i++) {
        for (int j = 0; j < v.size() - 1 - i; j++) {
            if (v[j] > v[j + 1])
                swap(v[j], v[j + 1]);
        }
    }
    cout << "Bubble Sort: ";
    printVector(v);
}

void selectionSort(vector<int> v) {
    for (int i = 0; i < v.size(); i++) {
        int min = i;
        for (int j = i + 1; j < v.size(); j++) {
            if (v[j] < v[min])
                min = j;
        }
        swap(v[i], v[min]);
    }
    cout << "Selection Sort: ";
    printVector(v);
}

void insertionSort(vector<int> v) {
    for (int i = 1; i < v.size(); i++) {
        int key = v[i];
        int j = i - 1;
        while (j >= 0 && v[j] > key) {
            v[j + 1] = v[j];
            j--;
        }
        v[j + 1] = key;
    }
    cout << "Insertion Sort: ";
    printVector(v);
}

void merge(vector<int>& v, int l, int m, int r) {
    vector<int> left(v.begin() + l, v.begin() + m + 1);
    vector<int> right(v.begin() + m + 1, v.begin() + r + 1);

    int i = 0, j = 0, k = l;

    while (i < left.size() && j < right.size()) {
        v[k++] = (left[i] <= right[j]) ? left[i++] : right[j++];
    }

    while (i < left.size()) v[k++] = left[i++];
    while (j < right.size()) v[k++] = right[j++];
}

void mergeSort(vector<int>& v, int l, int r) {
    if (l < r) {
        int m = (l + r) / 2;
        mergeSort(v, l, m);
        mergeSort(v, m + 1, r);
        merge(v, l, m, r);
    }
}

int partition(vector<int>& v, int low, int high) {
    int pivot = v[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
        if (v[j] < pivot) {
            i++;
            swap(v[i], v[j]);
        }
    }
    swap(v[i + 1], v[high]);
    return i + 1;
}

void quickSort(vector<int>& v, int low, int high) {
    if (low < high) {
        int pi = partition(v, low, high);
        quickSort(v, low, pi - 1);
        quickSort(v, pi + 1, high);
    }
}

int main() {
    vector<int> original = {34, 7, 23, 32, 5, 62};

    cout << "Vetor original: ";
    printVector(original);
    cout << endl;

    bubbleSort(original);
    selectionSort(original);
    insertionSort(original);

    vector<int> vMerge = original;
    mergeSort(vMerge, 0, vMerge.size() - 1);
    cout << "Merge Sort: ";
    printVector(vMerge);

    vector<int> vQuick = original;
    quickSort(vQuick, 0, vQuick.size() - 1);
    cout << "Quick Sort: ";
    printVector(vQuick);

    return 0;
}
