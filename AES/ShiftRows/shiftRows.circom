pragma circom  2.1.8;


template shiftRows(){ //used in expandKey fn
    // n = 16, #words of 8 bits each in AES-128
    // works on a whole block 
    /*  34 54 12 43         
        32 78 4f 94
        54 67 24 73   ==> 
        2e 54 65 4a  
    */
    signal input in[n];
    signal output out[n];

    signal one;
    one <--1;
    for (var i=0; i<4; i++) {
        out[i] <== one * in[ (i+r) % n ];
    }
}

component main = rotateWord(4);
// sift left and rotate by 1