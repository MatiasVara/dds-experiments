# create guest
# NOTE: in this guest you should change the host name to fedora30-guest-2
# $ hostnamectl set-hostname fedora30-guest-2
VM_IMAGE_2=./fedora30-demo-2.qcow2

sudo virsh destroy fedora30-guest-2
sudo virsh undefine fedora30-guest-2

sudo virt-install --print-xml -d --name fedora30-guest-2 --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=./fedora30-demo-2.qcow2 \
        --console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole
