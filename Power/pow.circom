pragma circom 2.1.4;

// Create a circuit which takes an input 'a',(array of length 2 ) , then  implement power modulo 
// and return it using output 'c'.

// HINT: Non Quadratic constraints are not allowed. 

template Pow() {
   
   signal input a[2];
   signal output out;
   var res=a[0]**a[1];
   signal one; one <-- 1;
   signal tmp; tmp <-- res;
   out <== tmp*one;
}

component main = Pow();

