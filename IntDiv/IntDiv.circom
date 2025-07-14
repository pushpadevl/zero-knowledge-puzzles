pragma circom 2.1.8;
//include "../node_modules/circomlib/circuits/comparators.circom";

// Create a circuit that is satisfied if `numerator`,
// `denominator`, `quotient`, and `remainder` represent
// a valid integer division. You will need a comparison check, so
// we've already imported the library and set n to be 252 bits.
//
// Hint: integer division in Circom is `\`.
// `/` is modular division
// `%` is integer modulus

template IntDiv(n) {
    signal input numerator;
    signal input denominator;
    signal input quotient;
    signal input remainder;
    
    signal output out;
    out <== numerator - (denominator * quotient + remainder);
    out ===0;
    
}
component main = IntDiv(252);

/* Why need a whole library for doing this simple task? Think of better usecases where we cannot make do without the comparator library
signal input numerator;
    signal input denominator;
    signal input quotient;
    signal input remainder;
    signal num;
    num <== denominator * quotient + remainder; 
    signal output out;
    out <== num-numerator;
*/

