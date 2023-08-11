In server:
./iperf3 -s 
In client:
./iperf3 -c 192.168.122.239 --logfile host-to-guest-udp.log
./iperf3 -c 192.168.122.239 -u --logfile host-to-guest-udp.log
