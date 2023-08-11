This setups two guest with ROS2 installed. It is possible to try the example by using the DDS Eclipse Cyclone. The communication works out-of-the-box. It is only important to disable the firewall in each guest. This is done by the firstboot script.
- To create guests run:
- ./create_guests.sh and grab a coffe
- I am using ROS2 dashing (May 2019)

To run the tests:
- firs ssh to any of the guest
- go to ~/ros2_dashing/src/eclipse-cyclonedds/cyclonedds/examples/perfscript
- edit perftest:
-localbindir=""
-locallibdir=""
+localbindir="~/ros2_dashing/src/eclipse-cyclonedds/cyclonedds/build/bin/"
+locallibdir="~/ros2_dashing/src/eclipse-cyclonedds/cyclonedds/build/lib/"
 for x in "" /Release /RelWithDebInfo bin/Debug ; do
     if [ -x bin$x/ddsperf -a -f lib$x/libddsc$libsuffix ] ; then
         localbindir=bin$x
@@ -215,7 +215,7 @@ export nwif=$rnwif
 export logdir=.
 #export trace=trace,-content
 cd $remotedir
-remotebindir=""
+remotebindir="~/ros2_dashing/src/eclipse-cyclonedds/cyclonedds/build/bin/"
- to launch:
- ./latency-test -i ens3 -I ens3 root@192.168.122.29
- the remote machine has to have the remotebindir as in the patch
- You are going to get the results in latency-result/
- To plot, execute: ./latency-test-plot ./latency-result/async-listener/ping.log
- It is going to ask the passw each time if the ssh is not set up.
- To compile cyclone:
- 304  mkdir build
- 305  cd build/
- 309  dnf install maven
- 310  cmake ..
- cmake --build . 
-  27  ssh-keygen -t rsa
   28  logout
   29  ssh-copy-id root@192.168.122.29
   30  ssh root@192.168.122.29

