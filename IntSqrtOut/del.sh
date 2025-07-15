#!/bin/bash
rm verification_key.json *.ptau "$1"_000* proof.json public.json witness.wtns $1.r1cs $1.sym 
rm "$1"_js/generate_witness.js "$1"_js/witness.wtns "$1"_js/input.json "$1"_js/$1.wasm "$1"_js/witness_calculator.js 
rmdir "$1"_js
