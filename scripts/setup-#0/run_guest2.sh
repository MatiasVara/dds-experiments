VM_IMAGE_2=./fedora30-demo-2.qcow2

qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE_2,format=qcow2,if=virtio \
    -device vhost-vsock-pci,guest-cid=5 \
    -nographic
