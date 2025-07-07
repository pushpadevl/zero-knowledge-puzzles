pragma circom 2.1.9;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality(n) {
   // Your Code Here..

   signal input a[n];
   signal output b[2];
   signal output c[2];
   //var b=a[0]; var c=a[1]; var d=a[2];
   signal output out;
   b[0] <== a[0]*a[1];
   b[1] <== b[0]*a[2]; //GM
   c[0] <== (a[0] +a[1] +a[2]) * (a[0] +a[1] +a[2]);
   c[1] <== c[0] * (a[0] +a[1] +a[2]); //AM cube
   out <== 27*b[1] - c[1];
   out === 0;
   
}

component main = Equality(3);
/* DOES NOT WORK (Non quadratic constraints, possibly because in out, b is directly replaced by a0 * a1, so it becomes non quadratic)

   signal input a[n];
   var b;
   signal output out;
   b = a[0]*a[1];
   out <== b*a[2]; //GM
*/

/* WORKS AM GM ineqaulity, although inefficient
signal input a[n];
   signal output b[2];
   signal output c[2];
   //var b=a[0]; var c=a[1]; var d=a[2];
   signal output out;
   b[0] <== a[0]*a[1];
   b[1] <== b[0]*a[2]; //GM
   c[0] <== (a[0] +a[1] +a[2]) * (a[0] +a[1] +a[2]);
   c[1] <== c[0] * (a[0] +a[1] +a[2]); //AM cube
   out <== 27*b[1] - c[1];
   out === 0;
   */