# create guest
OS_NAME=fedora-30
VM_IMAGE_1=./fedora30-demo-1.qcow2
VM_IMAGE_2=./fedora30-demo-2.qcow2

#sudo virsh destroy fedora30-guest
#sudo virsh undefine debian9-guest

ssh-keygen -t rsa -f keyguest -P ""

sudo virt-builder -v --ssh-inject root:file:./keyguest.pub \
	--selinux-relabel \
	--root-password password:redhat \
	--hostname fedora30-guest \
        --upload ./client.py:/root/client.py \
        --output $VM_IMAGE_1 \
        --format qcow2 --update \
        --size 6G $OS_NAME

cp $VM_IMAGE_1 $VM_IMAGE_2
