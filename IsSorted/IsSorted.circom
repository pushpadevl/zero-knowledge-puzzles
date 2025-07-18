pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Write a circuit that constrains the 4 input signals to be
// sorted. Sorted means the values are non decreasing starting
// at index 0. The circuit should not have an output.

template IsSorted(n) { //parameters 
    signal input in[n];
    
    component lt[n-1];
    signal output out[n-1];
    for (var i=1;i<n;i++){
        lt[i-1] = LessEqThan(252);
        lt[i-1].in[0] <== in[i-1];
        lt[i-1].in[1] <== in[i];
        lt[i-1].out === 1;
        out[i-1] <-- lt[i-1].out;
    }
    

}

component main = IsSorted(4);
/* Works but only with an output signal
signal input in[n];
    signal output out[n-1];
    component lt[n-1];
    for (var i=1;i<n;i++){
        lt[i-1] = LessEqThan(252);
        lt[i-1].in[0] <== in[i-1];
        lt[i-1].in[1] <== in[i];
        lt[i-1].out ==> out[i-1];
        out[i-1] === 1;
    }
*/
