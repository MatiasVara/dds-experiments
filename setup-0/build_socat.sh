git clone https://github.com/stefano-garzarella/socat-vsock.git
cd socat-vsock/
autoreconf -fiv
./configure
make socat
cd ..
