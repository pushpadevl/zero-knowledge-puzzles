pragma circom 2.1.8;
include "../circomlib/circuits/comparators.circom";

// Be sure to solve IntSqrt before solving this 
// puzzle. Your goal is to compute the square root
// in the provided function, then constrain the answer
// to be true using your work from the previous puzzle.
// You can use the Bablyonian/Heron's or Newton's
// method to compute the integer square root. Remember,
// this is not the modular square root.


function intSqrtFloor(x) {
    // compute the floor of the
    // integer square root
// Using the newton's method g_{i+1} = (g_i + a/g_i)/2 recursively until g_i <= g_{i+1}, a is fixed estimate, needs to carefully chosen; Here I chose a = x-1

    var a = x-1;
    var gi = x;
    var gip1 = (gi + a \ gi)\2;
    while( gip1 < gi){
        gi = gip1;
        gip1 = (gi + a \ gi)\2;
    }
    return gip1;
}
template IntSqrtOut(n) {
    signal input in;
    signal output out;
    signal diff;
    signal sqrt;
    sqrt <-- intSqrtFloor(in);

    diff <-- in - sqrt*sqrt;
    component lt = LessThan(n);
    lt.in[0] <-- diff;
    lt.in[1] <-- sqrt + sqrt +1;
    lt.out === 1;
    out <== sqrt;
    // constrain out using your
    // work from IntSqrt
}

component main = IntSqrtOut(252);

/* 49 
(49 + 6/49)/2 = 24
24 + 6/24 /2 = 12
(12 + 6/12)/2 = 6
(6 + 6/6)/2 = 3
3 
a should be greater than sqrt(x)

49 + 1 / 2 = 25
25 + 50/25 2 = 13
13 3 8
8 6 7
7 7 7
49 0 24
24 + 2 13
13 + 3 8
8 6 7
7 6 6
6 8 7
*/
/* 63, sqrt(63) = 7
63 64/63 /2 = 32
32 + 2 /2 = 17
17 + 3 /2 = 10
10 + 6 /2 = 8
8 + 8 /2 = 8    \\wrong on a = x+1 = 64
 Adding 1 on border elements gives wrong result
63 + 62/63 /2 = 31
31 + 2 /2 = 16
16 + 3 /2 = 9
9 + 62/9 /2 = 7
7 + 62/7 /2 = 7 \\correct on a = x-1 = 62
*/