# create guest
VM_IMAGE_1=./ubuntu-demo-1.qcow2

sudo virsh destroy ubuntu18-guest
sudo virsh undefine ubuntu18-guest

sudo virt-install --memballoon model=none -d --name ubuntu18-guest --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=./ubuntu-demo-1.qcow2 --os-variant ubuntu18.04\
        --os-type linux\
	--graphics none\
	--cputune vcpupin0.vcpu=0,vcpupin0.cpuset=3,vcpupin1.vcpu=1,vcpupin1.cpuset=4\
	--console pty,target_type=serial \
        --network network=default,model=virtio --noautoconsole
