#!/bin/bash

# http://wiki.ros.org/docker/Tutorials/GUI


./stop.sh

xhost +local:root

docker run -t -d --privileged --net=host \
--name worker_software \
--env ROS_DOMAIN_ID=11 \
--env="QT_X11_NO_MITSHM=1"  \
--env="DISPLAY"  \
--privileged \
--device=/dev/video0:/dev/video0 \
companion_software:latest
