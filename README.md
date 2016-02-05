# Lightweight LLVM­Dart binding

[![Build Status](https://travis-ci.org/samber/llvm_dart_binding.svg?branch=master)](https://travis-ci.org/samber/llvm_dart_binding)

[Work in progress]

Compilation from C to llvm ir:
$ clang -S -emit-llvm fac.c
or
$ clang -S -emit-llvm fac.c -O1
or
$ clang -S -emit-llvm fac.c -O2
or
$ clang -S -emit-llvm fac.c -O3
