pragma circom 2.1.4;


// In this exercise , you need to create a circuit that takes an array "a"
// of length '2' as input and a output "c" .
// Create a circuit that adds the 2 inputs and outputs it .

template Add() {
   // Your code here 
   signal input in1;
   signal input in2;
   signal output out;
   out <== (in1 + in2)*1;
}

component main  = Add();

