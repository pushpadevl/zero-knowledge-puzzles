#!/bin/bash
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
