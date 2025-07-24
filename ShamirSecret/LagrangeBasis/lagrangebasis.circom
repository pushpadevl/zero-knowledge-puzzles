pragma circom 2.1.4;

// Objective: Find the univariate lagrange basis polynomial evaluations at 0 using the distintct set of points in[]
// There are improvement techniques if the pattern among points order is known
template lagrangeBasis(n){
    signal input in[n]; //evaluation points
    signal output out[n];
    signal stmp[n];
    signal one<--1;
    for (var i=0;i<n;i++){
        var tmp = 1;
        var j=0;
        while(j<n){
            if(i==j) {j++;}
            else{
                tmp *= (0-in[j])/(in[i]-in[j]); // a/b means a*INV(b) in circom
                j++;
            }
        }
        stmp[i] <-- tmp;
        out[i] <== one*stmp[i];
    }
}
//component main = lagrangeBasis(4); When using as a library remove the main component
// 21888242871839275222246405745257275088548364400416034343698204186575808495615
//p = 21888242871839275222246405745257275088548364400416034343698204186575808495617
// equation = 7x^3 + 6x^2 + 4x + 14