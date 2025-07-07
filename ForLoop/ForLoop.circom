pragma circom 2.1.4;

// Input : 'a',array of length 2 .
// Output : 'c 
// Using a forLoop , add a[0] and a[1] , 4 times in a row .

template ForLoop() {

signal input a[2];
signal one;
one <-- 20;
var sum =0;
for(var j=0;j<4;j++){
    sum += a[0] + a[1];    
}
    signal output c;
    c <== one*sum; // 4*(a[0]+a[1])
}  

component main = ForLoop();


/*Works but too many signals

signal input a[2];
signal one;
one <-- 1;
signal sum[4];
for(var j=0;j<4;j++){
    sum[j] <-- one*(a[0]+a[1]);    
}
    signal output c;
    c <== one*(sum[3] + sum[2] + sum[1] + sum[0]); // 4*(a[0]+a[1])
}  

*/
/* DNW Scal..
signal input a[2];
signal output c;
c <== a[0]*(a[0]+a[1]); 

}  
*/

/* Works 
..
signal input a[2];
signal output c;
c <== a[0]*a[1]; // changed + to * 
*/

/* DNW Scalar size does not match
..
signal input a[2];
signal output c;
c <== a[0]+a[1]; 
*/


/* DNW Scalar size does not match

signal input x;
signal input y;
signal output out;

out <== 4*(x + y); 
*/
/* Does not work
signal input x[2];
signal output out;

var sum=0;
sum = 4*(x[0] + x[1]); 
out <== sum;
*/