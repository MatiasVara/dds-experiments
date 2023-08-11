# create guest
OS_NAME=ubuntu-18.04
VM_IMAGE_1=./ubuntu-demo-2.qcow2

virt-builder -v --ssh-inject root:file:./id_rsa.pub \
	--root-password password:redhat \
	--hostname ubuntu-guest2 \
        --upload ./install_someip.sh:/root/install_someip.sh \
        --upload ./01-netcfg-guest2.yaml:/etc/netplan/01-netcfg.yaml \
        --copy-in ./examples:/root/ \
	--output $VM_IMAGE_1 \
	--install "vim,libboost-all-dev,git,cmake"\
        --format qcow2 --update \
	--edit '/etc/default/grub: s/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="console=ttyS0"/' \
        --run-command '/usr/sbin/update-grub2' \
	--size 10G $OS_NAME \
	--firstboot ./install_someip.sh
