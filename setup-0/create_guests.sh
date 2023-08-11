# create guest
OS_NAME=fedora-30
VM_IMAGE_1=./fedora30-demo-1.qcow2
VM_IMAGE_2=./fedora30-demo-2.qcow2

sudo virt-builder -v --ssh-inject root:file:./id_rsa.pub \
	--selinux-relabel \
	--root-password password:redhat \
	--copy ./iperf-vsock:~/iperf-vsock
	--hostname fedora30-guest \
        --upload ./client.py:/root/client.py \
        --upload ./server.py:/root/server.py \
        --output $VM_IMAGE_1 \
        --install "git,automake,libtool,make" \
	--format qcow2 --update \
        --size 6G $OS_NAME \
	--firstboot ./setup.sh

cp $VM_IMAGE_1 $VM_IMAGE_2
