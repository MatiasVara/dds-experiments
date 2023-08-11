git clone https://github.com/stefano-garzarella/iperf-vsock
cd iperf-vsock/
./bootstrap.sh
mkdir build
cd build/
../configure
make
cd ../..
