#!/bin/bash

# http://wiki.ros.org/docker/Tutorials/GUI


./stop.sh

xhost +local:root

#!/bin/bash

# http://wiki.ros.org/docker/Tutorials/GUI

./stop.sh

xhost +local:root

docker run -t -d --privileged --net=host \
--name worker_software \
--env ROS_DOMAIN_ID=11 \
--env="QT_X11_NO_MITSHM=1"  \
--env="DISPLAY"  \
-v $PWD/../../flipkart_grid_backend:/root/home/flipkart_grid_backend \
-v $PWD/../../flipkart_grid_frontend_react:/root/home/flipkart_grid_frontend_react \
worker_software:latest

