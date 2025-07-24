#!/bin/bash
rm verification_key.json "$1"_000* proof.json *.ptau public.json witness.wtns $1.r1cs $1.sym 
rm "$1"_js/*
rm "$1"_cpp/*
rmdir "$1"_cpp
rmdir "$1"_js
