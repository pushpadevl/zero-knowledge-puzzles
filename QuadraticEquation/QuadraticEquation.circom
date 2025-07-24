pragma circom 2.1.4;

include "../circomlib/circuits/comparators.circom";

// Create a Quadratic Equation( ax^2 + bx + c ) verifier using the below data.
// Use comparators.circom lib to compare results if equal

template QuadraticEquation() {
    signal input x;     // x value
    signal input a;     // coeffecient of x^2
    signal input b;     // coeffecient of x 
    signal input c;     // constant c in equation
    signal input res;   // Expected result of the equation
    signal output out;  // If res is correct , then return 1 , else 0 . 

    // your code here
    var ax2 = a*x*x;
    var bx = b*x;
    var tot = ax2 + bx + c;
    component eq = IsEqual();
    eq.in[0] <-- tot;
    eq.in[1] <-- res;
    out <== eq.out;
}

component main  = QuadraticEquation();



