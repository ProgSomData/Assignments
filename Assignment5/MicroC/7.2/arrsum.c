
void main() {
    int p;
    int ia[4];
    ia[0] = 7;
    ia[1] = 13;
    ia[2] = 9;
    ia[3] = 8;
    arrsum(4, ia, &p);
}


void arrsum(int i, int arr[], int *sump) {
    int n;

    *sump = 0;

    for (n = 0; n < i; n = n + 1) {
        *sump = *sump + arr[n];
    }

    /*
    while (n < i) {
        *sump = *sump + arr[n];
        
        n = n+1;
    }
    */
}



