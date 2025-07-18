pragma circom  2.1.8;

/* Purpose: Check whether the ky expansion happened correctly

*/
function 
template kex(){
    signal input in[2];
    signal output out[3];

    var a = sha256K(16);
    var b = sha256K(24);

    out[0] <== a;
    out[1] <== b;
    out[2] <-- in[0] \ in[1];
    out[2]*in[1] === in[0];
}
component main = macrocheck();

/* DNW
Non quadratic constraint

    out[0] <== a;
    out[1] <== b;
    out[2] <== in[0] \ in[1];

Works

    out[0] <== a;
    out[1] <== b;
    out[2] <-- in[0] \ in[1];
    out[2]*in[1] === in[0];
*/