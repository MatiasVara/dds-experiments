VM_IMAGE_1=./fedora30-demo-1.qcow2

qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE_1,format=qcow2,if=virtio \
    -device vhost-vsock-pci,guest-cid=4 \
    -nographic
