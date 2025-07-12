pragma circom  2.1.8;

template fun(n) {
    signal input a[n];
    signal input k;
    signal output out;

    if(n<2){
        out <== a[0]-k;
        out === 0;
    }else{

    var diff=1;
    signal output res[n-1];
    res[0] <== (a[0]-k) * (a[1]-k);
    for (var i = 1; i < (n-1); i++) {
        res[i] <== res[i-1] *(a[i+1]-k);
    }
    out <== res[n-2];
    out === 0;
    }
}
component main = fun(10);
/* Works with scaling
signal input a[n];
    signal input k;
    signal output out;

    if(n<2){
        out <== a[0]-k;
        out === 0;
    }else{

    var diff=1;
    signal output res[n-1];
    res[0] <== (a[0]-k) * (a[1]-k);
    for (var i = 1; i < (n-1); i++) {
        res[i] <== res[i-1] *(a[i+1]-k);
    }
    out <== res[n-2];
    out === 0;
    }
    */

/* Works but not scalable to array of size > 2
signal input a[n];
    signal input k;
    signal output out;

    var diff=1;
    for (var i = 0; i < 2; i++) { 
        diff *= a[i] - k;
    }
    out <== diff;
    out ===0;
    */