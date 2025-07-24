pragma circom 2.1.4;


// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION

template NotEqual() { 

signal input in[2];
signal output c;

var res = in[0]-in[1];                          // could use XOR maybe, check
var isNonZero=0;                                
for(var i=0;i<254;i++){
    isNonZero = isNonZero | (1 & (res >>i));    // OR of all bits
}
isNonZero ^= 1;                                 
signal one; signal isNZ;
one <--1; isNZ <-- isNonZero;
c <==  one*isNZ; // with isNZ only, no non linear constraints are formed, 


}

component main = NotEqual(); // bits = |_log2(n)_| + 1, check the max bits that could be used, then remove this and use that number for the loop 