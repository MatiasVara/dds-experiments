sudo virt-install -d --name debian9-guest --import --ram 2048 --vcpus 2 --cpu host \
        --disk bus=virtio,path=./debian9-demo.qcow2 \
        --network network=default,model=virtio\
        --qemu-commandline='-device vhost-vsock-device,guest-cid=3' \
        --qemu-commandline=''
