# create guest
VM_IMAGE_1=../setup-1/fedora30-demo-1.qcow2

sudo virsh destroy fedora30-guest
sudo virsh undefine fedora30-guest

./virt-manager-2.1.0/virt-install -d --name fedora30-guest --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=$VM_IMAGE_1 \
        --console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole \
        --vsock cid=3
