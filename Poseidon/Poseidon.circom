pragma circom 2.1.4;
include "../circomlib/circuits/poseidon.circom";

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
   signal input a;
   signal input b;
   signal input c;
   signal input d;
   
   signal output out;
   component phash = Poseidon(4);
   phash.inputs[0] <-- a;
   phash.inputs[1] <-- b;
   phash.inputs[2] <-- c;
   phash.inputs[3] <-- d;

   out <== phash.out;   
   // Your Code here.. 
}

component main = poseidon();