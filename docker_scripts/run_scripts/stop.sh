#!/bin/bash
docker stop worker_software && docker rm worker_software

xhost -local:root
