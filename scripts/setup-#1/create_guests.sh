# create guest
OS_NAME=fedora-30
VM_IMAGE_1=./fedora30-demo-1.qcow2
VM_IMAGE_2=./fedora30-demo-2.qcow2

sudo virt-builder -v --ssh-inject root:file:./id_rsa.pub \
	--selinux-relabel \
	--root-password password:redhat \
	--hostname fedora30-guest \
        --upload ./install_ros.sh:/root/install_ros.sh \
	--output $VM_IMAGE_1 \
        --format qcow2 --update \
	--install "maven,gdb,tar,asio-devel,cmake,cppcheck,eigen3-devel,gcc-c++,liblsan,libXaw-devel,libyaml-devel,make,opencv-devel,patch,python3-argcomplete,python3-colcon-common-extensions,python3-coverage,python3-devel,python3-empy,python3-lark-parser,python3-lxml,python3-mock,python3-nose,python3-pep8,python3-pip,python3-pydocstyle,python3-pyflakes,python3-pyparsing,python3-pytest,python3-pytest-cov,python3-pytest-runner,python3-rosdep,python3-setuptools,python3-vcstool,python3-yaml,poco-devel,poco-foundation,python3-flake8,python3-flake8-import-order,redhat-rpm-config,tinyxml-devel,tinyxml2-devel,uncrustify,wget" \
	--size 10G $OS_NAME \
	--firstboot ./install_ros.sh

# copy after the install_root has finished
#cp $VM_IMAGE_1 $VM_IMAGE_2
