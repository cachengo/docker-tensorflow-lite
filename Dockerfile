FROM debian:stretch

RUN apt-get update \
    && apt-get install -y build-essential git curl unzip zlib1g-dev \
    && git clone https://github.com/tensorflow/tensorflow.git \
    && cd /tensorflow \
    && ./tensorflow/contrib/lite/tools/make/download_dependencies.sh

RUN cd /tensorflow \
    && CC_PREFIX=arm-linux-gnueabihf- make -j 3 -f tensorflow/contrib/lite/tools/make/Makefile
