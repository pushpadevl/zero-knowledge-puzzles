pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Create a circuit that is satisfied if
// in[0] is the floor of the integer integer
// sqrt of in[1]. For example:
// 
// int[2, 5] accept
// int[2, 5] accept
// int[2, 9] reject
// int[3, 9] accept
//
// If b is the integer square root of a, then
// the following must be true:
//
// (b - 1)(b - 1) < a
// (b + 1)(b + 1) > a
// 
// be careful when verifying that you 
// handle the corner case of overflowing the 
// finite field. You should validate integer
// square roots, not modular square roots

template IntSqrt(n) {
    signal input in[2];
    signal output out;
    component zero = IsZero();
    zero.in <== in[1];
    zero.out === 0;
    signal n2;
    n2 <-- in[1] - in[0]*in[0];
    component lt = LessThan(n);
    lt.in[0] <-- n2;
    lt.in[1] <-- in[0] + in[0] + 1;
    lt.out ==> out;
    out === 1;
    
}
// refer to the lessons_extra_constraints file for doubts

component main = IntSqrt(252);
