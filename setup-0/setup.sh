cd iperf-vsock/
./bootstrap.sh
# esto falla si existe
mkdir build
cd build/
../configure #../configure --disable-dependency-tracking
make
