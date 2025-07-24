pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Write a circuit that returns true when at least one
// element is 1. It should return false if all elements
// are 0. It should be unsatisfiable if any of the inputs
// are not 0 or not 1.

template MultiOR(n) {
    signal input in[n];
    signal output out;

    var ans=0;
    for (var i=0;i<n;i++){
        (in[i])*(in[i]-1) === 0; //assert for binary check
        ans |= in[i];
    }
    signal res; res <-- ans;
    out <== res;
    //signal one; one<--1;
    //out <== res*one;

}

component main = MultiOR(4);
