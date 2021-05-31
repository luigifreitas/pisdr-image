#!/bin/bash -e

on_chroot << EOF

mkdir hpsdr
cd hpsdr
git clone https://github.com/g0orx/wdsp

cd wdsp
make
make install
ldconfig

cd ..
git clone https://github.com/g0orx/pihpsdr
cd pihpsdr

make
chown root pihpsdr
chmod u+s pihpsdr
cp relase/pihpsdr/hpsdr.png .

EOF