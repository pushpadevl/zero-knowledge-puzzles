pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Write a circuit that constrains the 4 input signals to be
// sorted. Sorted means the values are non decreasing starting
// at index 0. The circuit should not have an output.

template IsSorted(n) { //parameters 
    signal input in[n];
    
    component lt[n-1];
    for (var i=0;i<n-1;i++){
        lt[i] = LessEqThan(252);
        lt[i].in[0] <== in[i];
        lt[i].in[1] <== in[i+1];
        lt[i].out === 1;
     }
    

}

component main{public [in]} = IsSorted(4);

/* Making the input signal public works. 
Claude response: Circom may not generate proper witnesses for intermediate signals that appear "unused"
The compiler optimizes constraint paths and can skip witness generation for signals that don't lead to outputs
*/

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
