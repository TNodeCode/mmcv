# This is the base image we build our image on
FROM bitnami/pytorch:1.13.1

# Get root priviledges
USER root

# Install a C++ compiler whiich is needed for compiling mvcc
RUN apt-get update && apt-get install -y g++

# Copy the code of the root directory of this repository into the /mmcv directory of the docker image
COPY ./ /mmcv

# Compile and install mmdet
RUN cd /mmcv && FORCE_CUDA=0 MMCV_WITH_OPS=1 pip install -e . -v