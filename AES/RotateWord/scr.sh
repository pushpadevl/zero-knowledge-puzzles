#!/bin/bash

echo "Compiling $1.circom..."
if [ ! "$1" ]; then 
    echo "asdasd"
    exit
fi

circom "$1".circom -l "../../circomlib/" --r1cs --wasm --sym --c -o .

cd "$1"_cpp
make
./"$1" ../input.json ../witness.wtns
cd ..
# Start a new powers of tau ceremony
snarkjs powersoftau new bn128 14 pot12_0000.ptau -v

# Contribute to the ceremony
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

# Start generating th phase 2
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

# Generate a .zkey file that will contain the proving and verification keys together with all phase 2 contributions
snarkjs groth16 setup "$1".r1cs pot12_final.ptau "$1"_0000.zkey

# Contribute to the phase 2 of the ceremony
snarkjs zkey contribute "$1"_0000.zkey "$1"_0001.zkey --name="$2" -v

# Export the verification key
snarkjs zkey export verificationkey "$1"_0001.zkey verification_key.json

# Generate a zk-proof associated to the circuit and the witness. This generates proof.json and public.json
snarkjs groth16 prove "$1"_0001.zkey witness.wtns proof.json public.json

# Verify the proof
snarkjs groth16 verify verification_key.json public.json proof.json

#snarkjs zkey export solidityverifier "$1"_0001.zkey ../contracts/verifier.sol

# Generate and print parameters of call
#snarkjs generatecall | tee parameters.txt
