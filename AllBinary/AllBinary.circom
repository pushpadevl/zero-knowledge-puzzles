pragma circom 2.0.0;

// Create constraints that enforces all signals
// in `in` are binary, i.e. 0 or 1.

template isBinary(){    // no paramters needed here, just declare with in and out and use as isBinary() instantiation and then bins[i].bit <== in[i];
    signal input bit;
    signal output out;

    out <== bit * (1 - bit);
}
template AllBinary(n) {
    signal input in[n];
    signal output out;
    component bins[n];
    var ot=0;
    for (var i = 0; i < n; i++){
        bins[i] = isBinary();
        bins[i].bit <== in[i];
        ot += bins[i].out;
    }
    out <== ot;
    out === 0; // Ensure that all bits are binary, i.e. 0 or 1
}

component main = AllBinary(4);
