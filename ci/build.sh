#!/usr/bin/env bash

set -ex

COMPILER="$1"
RELEASE="$2"
ABI="$3"
BLOSC="$4"
SIMD="$5"

mkdir build
cd build
cmake \
    -DCMAKE_CXX_COMPILER=${COMPILER} \
    -DCMAKE_BUILD_TYPE=${RELEASE} \
    -DOPENVDB_ABI_VERSION_NUMBER=${ABI} \
    -DOPENVDB_USE_DEPRECATED_ABI=ON \
    -DUSE_BLOSC=${BLOSC} \
    -DOPENVDB_CXX_STRICT=ON \
    -DOPENVDB_BUILD_PYTHON_MODULE=ON \
    -DOPENVDB_BUILD_UNITTESTS=ON \
    -DOPENVDB_BUILD_BINARIES=ON \
    -DOPENVDB_BUILD_VDB_PRINT=ON \
    -DOPENVDB_BUILD_VDB_LOD=ON \
    -DOPENVDB_BUILD_VDB_RENDER=ON \
    -DOPENVDB_BUILD_VDB_VIEW=OFF \
    -DOPENVDB_SIMD=${SIMD} \
    ..
make -j2
