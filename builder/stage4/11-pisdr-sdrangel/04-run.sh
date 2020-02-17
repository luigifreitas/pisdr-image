#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Software"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Software"

if [ ! -d "codec2" ]; then
    git clone https://github.com/drowe67/codec2.git
fi

cd codec2
git pull
git reset --hard 76a20416d715ee06f8b36a9953506876689a3bd2
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc)
make install
ldconfig
EOF