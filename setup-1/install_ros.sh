dhclient ens3
systemctl stop firewalld
systemctl disable firewalld
mkdir -p ~/ros2_dashing/src
cd ~/ros2_dashing
wget https://raw.githubusercontent.com/ros2/ros2/dashing/ros2.repos
vcs import src < ros2.repos
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 rti-connext-dds-5.3.1 urdfdom_headers"
touch ./src/ros2/rviz/AMENT_IGNORE 
colcon build --symlink-install
cd ~
git clone https://github.com/eclipse-cyclonedds/cyclonedds.git
cd cyclonedds
mkdir build
cd build
cmake ..
cmake --build .
cd ~
# 1. to run the ROS2 example, execute:
#. ~/ros2_dashing/install/setup.bash
#. ~/ros2_dashing/install/local_setup.bash
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# ros2 run demo_nodes_py listener
# ros2 run demo_nodes_py talker
# 2. to run tests in eclipse cyclone dds (choose one and copy the ssh key first, e.g., fedora30-guest):
# ssh-keygen -t rsa
# ssh-copy-id root@fedora30-guest-2
# cd  ~/cyclonedds
# sed -i 's/localbindir=""/localbindir="~\/cyclonedds\/build\/bin\/"/g' ./examples/perfscript/perftest
# sed -i 's/remotebindir=""/remotebindir="~\/cyclonedds\/build\/bin\/"/g' ./examples/perfscript/perftest
# sed -i 's/locallibdir=""/locallibdir="~\/cyclonedds\/build\/lib\/"/g' ./examples/perfscript/perftest
# cd ./examples/perfscript
# ./latency-test root@fedora30-guest 
