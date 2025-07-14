pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Use the same constraints from IntDiv, but this
// time assign the quotient in `out`. You still need
// to apply the same constraints as IntDiv
template IntDivOut(n) {
    signal input numerator;
    signal input denominator;
    signal output out;
    
    // Internal signals for division computation
    signal remainder;
    signal quotient;
    
    component den_zerocheck = IsZero();
    den_zerocheck.in <== denominator;
    den_zerocheck.out === 0;
    
    quotient <-- numerator \ denominator;
    
    //remainder <-- numerator % denominator;
    
    out <== quotient;
    
    //numerator === quotient * denominator + remainder;
        
}

component main = IntDivOut(252);