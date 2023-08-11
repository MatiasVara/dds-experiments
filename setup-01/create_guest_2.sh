# create guest
VM_IMAGE_2=../setup-1/fedora30-demo-2.qcow2

sudo virsh destroy fedora30-guest-2
sudo virsh undefine fedora30-guest-2

./virt-manager-2.1.0/virt-install -d --name fedora30-guest-2 --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=$VM_IMAGE_2 \
        --console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole \
        --vsock cid=4
