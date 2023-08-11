VM_IMAGE_1=../setup-1/fedora30-demo-1.qcow2
PORT=10200

# NOTE: to control guest run `nc localhost 45454`
qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE_1,format=qcow2,if=virtio \
    -netdev tap,id=hostnet0 -device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:b0:77:2c,bus=pci.0,addr=0x3 \
    -device vhost-vsock-pci,guest-cid=4 \
    -nographic \
    -monitor telnet::45454,server,nowait -serial file:./fedora30-1-serial &
# NOTE: to ssh guest do `ssh -p $PORT root@localhost`
