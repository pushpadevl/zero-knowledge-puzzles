pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'


template LT(n){
    signal input in[2]; //check if in[0]<in[b]
    signal output out;
    assert(in[0]<in[1]);
    
    // doing in[0] - in[1] + 2^n, if in[0]>in[1] then this sum >2^n hence the MSB=1, if not MSB=0
    signal sum; sum <-- 1<<(1+n) + in[0] - in[1];
    signal MSB; MSB <-- sum >> (1+n);       // don't use vars, vars are for javascript compilation
    out <== 1-MSB;
}
template Range() {
    // your code here
signal input a;
signal input lowerbound; 
signal input upperbound;
signal output out;
component lt = LT(6);
lt.in[1] <--a;
lt.in[0] <-- lowerbound;

component rt = LT(6);
rt.in[0] <-- a;
rt.in[1] <-- upperbound;

out <== lt.out * rt.out;   
}

component main  = Range();


/* DNW
template Range() {
    // your code here
signal input a;
signal input lowerbound; 
signal input upperbound;
signal output out;
var d1 = (a - lowerbound);
var d2 = a - upperbound;
signal int;
int <-- d1*d2;
out <== int;
   
}

component main{public [a, lowerbound,upperbound]}  = Range();
*/