# create guest
OS_NAME=fedora-30
OS_VARIANT=fedora30
VM_IMAGE=./fedora30-demo.qcow2

#sudo virsh destroy fedora30-guest
#sudo virsh undefine debian9-guest

ssh-keygen -t rsa -f keyguest -P ""

if [ ! -f "${VM_IMAGE}" ]; then
	sudo virt-builder -v --ssh-inject root:file:./keyguest.pub \
        --selinux-relabel \
        --root-password password:redhat \
        --hostname fedora30-guest \
        --upload /root/scriptsforvsockguest/upload/client.py:/root/client.py \
        --output $VM_IMAGE \
        --format qcow2 --update \
        --install "vim" \
        --size 10G $OS_NAME
fi

qemu-system-x86_64 \
    -machine accel=kvm:tcg -cpu host -m 2048 -smp 2\
    -drive file=$VM_IMAGE,format=qcow2,if=virtio \
    -device vhost-vsock-pci,guest-cid=4 \
    -nographic
