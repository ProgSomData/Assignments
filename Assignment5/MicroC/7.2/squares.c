

void main() {
    int ia[20];
    int p;
    squares (16, ia);
    arrsum(16, ia, &p);
}


void squares (int n, int arr[]) {
    int i;
    
    for (i = 0; i < n; i = i + 1) {
        arr[i] = i * i;
    }
    
    /*
    while (i < n) {
        arr[i] = i*i;
        i = i+1;
    }

    */
}