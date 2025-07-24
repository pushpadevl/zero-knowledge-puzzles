pragma circom  2.1.8;

// prove that p, q are knwon to prover
// simple multiplcation check pxq = N cannot be used as we can't reveal p or q and outputting N is useless
// In RSA, d (secret key) can be calc from e(public key) in mod (N = pq) iff p an q are known, hence phi(N) = (p-1)(q-1) is known.
// INPUT p, q, N=pq, e, d
template RSA(){
    signal input p;
    signal input q;
    signal input e;
    signal input d;    // d and e are such that GCD(d, phiN) = 1 = GCD(e, phiN)
    signal input N;
    N === q*p;
    var phiN = (p-1)*(q-1);
    var chk = (d*e) % phiN;
    signal   tmp <-- chk; 

    tmp === 1;
}
component main{public [e,N]} = RSA();