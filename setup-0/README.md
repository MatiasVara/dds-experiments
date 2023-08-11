This setup two guests, each has a client.py that communicate to server.py by using virtio-vsocket.
To test by using iperf3:
- In guest: ./iperv3 --vsock -s
- in host: ./iperf3 --vsock -c 4 --logfile vsock-host-to-guest.log
To test, guest-to-guest communication, you need to set up socat:
./socat VSOCK-LISTEN:5201,reuseaddr,fork VSOCK-CONNECT:4:5201
