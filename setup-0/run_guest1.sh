VM_IMAGE_1=./fedora30-demo-1.qcow2
PORT=10200

# NOTE: to control guest run `nc localhost 45454`
qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE_1,format=qcow2,if=virtio \
    -net user,hostfwd=tcp::$PORT-:22 -net nic \
    -device vhost-vsock-pci,guest-cid=4 \
    -nographic \
    -monitor telnet::45454,server,nowait -serial file:./fedora30-1-serial &
# NOTE: to ssh guest do `ssh -p $PORT root@localhost`
