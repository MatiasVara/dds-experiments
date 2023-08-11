# create guest
OS_NAME=ubuntu-18.04
VM_IMAGE_1=./ubuntu-demo-1.qcow2
VM_IMAGE_2=./ubuntu-demo-2.qcow2

virt-builder -v --ssh-inject root:file:./id_rsa.pub \
	--root-password password:redhat \
	--hostname ubuntu-guest1 \
        --upload ./install_someip.sh:/root/install_someip.sh \
	--output $VM_IMAGE_1 \
	--install "vim,libboost-all-dev,git,cmake"\
        --format qcow2 --update \
	--edit '/etc/default/grub: s/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="console=ttyS0"/' \
        --run-command '/usr/sbin/update-grub2' \
	--size 10G $OS_NAME \
	--firstboot ./install_someip.sh

# copy after the install_root has finished
#cp $VM_IMAGE_1 $VM_IMAGE_2
