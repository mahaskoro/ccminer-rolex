#!/bin/bash

ARCH="-march=armv8-a+crypto+sha2+crc"
CORE="-mtune=cortex-a53"
OPTI="-O3 -ffast-math -pthread -fopenmp -flto -fstrict-aliasing -ftree-vectorize -funroll-loops -ffinite-loops -finline-functions -fno-stack-protector -fomit-frame-pointer -fpic -falign-functions=64 -D_REENTRANT"

./configure CXXFLAGS="$ARCH $CORE $OPTI" CFLAGS="$ARCH $CORE $OPTI" \
CXX=clang++ CC=clang  LDFLAGS="-Wl,-hugetlbfs-align -fuse-ld=lld"
