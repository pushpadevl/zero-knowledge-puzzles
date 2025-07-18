pragma circom  2.1.8;


template rotateWord(n,r){ //used in expandKey fn
    //rotateleft by 1 byte
    //4 bytes rotate only
    signal input in[n];
    signal output out[n];
/*
    out[0] <== in[1]; 
    out[1] <== in[2];
    out[2] <== in[3];
    out[3] <== in[0];
*/
    signal one;
    one <--1;
    for (var i=0; i<n; i++) {
        out[i] <== one * in[ (i+r) % n ];
    }
}

component main = rotateWord(4,1);
// sift left and rotate by 1