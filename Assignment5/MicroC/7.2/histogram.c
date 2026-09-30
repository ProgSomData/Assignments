

void main(){
    int seq[7];
    seq[0] = 4;
    seq[1] = 3;
    seq[2] = 4;
    seq[3] = 2;
    seq[4] = 1;
    seq[5] = 1;
    seq[6] = 0;

    int freq[5];
    freq[0] = 0;
    freq[1] = 0;
    freq[2] = 0;
    freq[3] = 0;
    freq[4] = 0;

    histogram(7, seq, 4, freq);
    
    print (freq[0]);
    print (freq[1]);
    print (freq[2]);
    print (freq[3]);
    print (freq[4]);
}




void histogram(int n, int ns[], int max, int freq[]){
    int i;
    int p;

    for (i = 0; i < n; i = i + 1) {
        p = ns[i];
        freq[p] = freq[p] + 1;
    }

    
    /*
    while (i < n) {
        int p;
        p = ns[i];
        freq [p] = freq[p] + 1;

        i = i+1;
    }
    */
}