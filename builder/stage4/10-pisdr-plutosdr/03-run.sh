#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PlutoSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PlutoSDR"

if [ ! -d "SoapyPlutoSDR" ]; then
    git clone https://github.com/pothosware/SoapyPlutoSDR.git
fi

cd SoapyPlutoSDR
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc)
make install
ldconfig
EOF