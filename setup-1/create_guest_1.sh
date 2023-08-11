# create guest
VM_IMAGE_1=./fedora30-demo-1.qcow2

sudo virsh destroy fedora30-guest
sudo virsh undefine fedora30-guest

sudo virt-install --print-xml -d --name fedora30-guest --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=./fedora30-demo-1.qcow2 \
        --console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole
