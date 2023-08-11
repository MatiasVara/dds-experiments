# create guest
VM_IMAGE_1=./fedora30-demo-1.qcow2

sudo virsh destroy fedora30-guest
sudo virsh undefine fedora30-guest

sudo virt-install  --memballoon model=none -d --name fedora30-guest --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=../setup-1/fedora30-demo-1.qcow2 --os-variant fedora29\
        --os-type linux\
	--graphics none\
	--install "vim"\
	--cputune vcpupin0.vcpu=0,vcpupin0.cpuset=0-1,vcpupin1.vcpu=1,vcpupin1.cpuset=0-1\
	--console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole
