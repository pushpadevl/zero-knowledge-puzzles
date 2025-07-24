pragma circom 2.1.8;

// Create a circuit that takes an array of signals `in` and
// returns 1 if all of the signals are 1. If any of the
// signals are 0 return 0. If any of the signals are not
// 0 or 1 the circuit should not be satisfiable.

template MultiAND(n) {
    signal input in[n];
    signal output out;

    var ans=1;
    for (var i=0;i<n;i++){
        (in[i])*(in[i]-1) === 0; //assert for binary check
        ans &= in[i];
    }
    signal res; res <-- ans;
    out <== res;
    //signal one; one<--1;
    //out <== res*one;
    

}

component main = MultiAND(4);
