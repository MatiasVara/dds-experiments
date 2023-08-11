VM_IMAGE_2=./fedora30-demo-2.qcow2
PORT=10201

# TODO: execute 'hostname fedora30-guest-2'
# NOTE: to control guest run `nc localhost 45455`
qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE_2,format=qcow2,if=virtio \
    -net user,hostfwd=tcp::$PORT-:22 -net nic \
    -device vhost-vsock-pci,guest-cid=5 \
    -nographic \
    -monitor telnet::45455,server,nowait -serial file:./fedora30-2-serial &
# NOTE: to ssh guest do `ssh -p $PORT root@localhost`
