# copy the corresponding /etc/netplan/01-netcfg.yaml
netplan apply
cd /root/
git clone https://github.com/GENIVI/vsomeip.git
cd vsomeip
git checkout f5d9ec2
mkdir build
cd build
cmake -DENABLE_SIGNAL_HANDLING=1 ..
make
