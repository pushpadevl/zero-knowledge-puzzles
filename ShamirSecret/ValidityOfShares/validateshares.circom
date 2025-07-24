pragma circom 2.1.8;
include "../LagrangeBasis/lagrangebasis.circom";
include "../../../circomlib/circuits/comparators.circom";

//check whether the given shares are valid and is equal to the shared message m. 
template ValidateShares(n){
    signal input x[n];              // shares are eval at these points
    signal input shares[n];         // shares values
    signal input message;                 // shared message
    signal output out;              // Outs 1 if valid, 0 otherwise
    var sum=0;
    
    component bases = lagrangeBasis(n);
    for( var i=0;i<n;i++) bases.in[i] <-- x[i];

    for(var i=0;i<n;i++){
        //out[i] <== bases.out[i] * shares[i];
        sum += bases.out[i] * shares[i];
    }
    signal ssum <-- sum;
    component isE = IsEqual();
    isE.in[0] <-- ssum; 
    isE.in[1] <-- message;
    out <== isE.out;
    //out2<== ssum * 1;
    
}
component main = ValidateShares(4);
// 21888242871839275222246405745257275088548364400416034343698204186575808495615
//p = 21888242871839275222246405745257275088548364400416034343698204186575808495617
// equation = 7x^3 + 6x^2 + 4x + 14
/* [
 "124",
 "21888242871839275222246405745257275088548364400416034343698204186575808495005",
 "1076",
 "21888242871839275222246405745257275088548364400416034343698204186575808495043"
]*/