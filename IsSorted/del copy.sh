#!/bin/bash
rm verification_key.json *.ptau "$1"_000* proof.json public.json witness.wtns $1.r1cs $1.sym 
cd "$1"_cpp  exit


cd ../"$1"_js 
cd ..
rmdir "$1"_cpp "$1"_js
