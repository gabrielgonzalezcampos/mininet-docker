ARG BASE_IMAGE=debian:stretch-slim
FROM ${BASE_IMAGE}
MAINTAINER David Bainbridge <dbainbri@ciena.com>

USER root
WORKDIR /root

COPY  docker-entry-point /docker-entry-point

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
	gnupg \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /docker-entry-point

RUN apt-get install -y --no-install-recommends \
 automake \
 cmake \
 libjudy-dev \
 libgmp-dev \
 libpcap-dev \
 libboost-all-dev \
 libevent-dev \
 libtool \
 flex \
 bison \
 pkg-config \
 g++ \
 libssl-dev \
 libnanomsg-dev \
 libjudy-dev \
 libreadline-dev \
 valgrind libtool-bin \
 libboost-dev \
 libboost-system-dev \
 libboost-thread-dev
 
RUN apt-get install -y --no-install-recommends python3-pip python3-dev

RUN pip3 install nnpy

RUN echo "==> Installing Thrift..."

RUN cd ~/ && git clone https://github.com/apache/thrift && cd thrift && git checkout v0.13.0 && ./bootstrap.sh && ./configure --prefix=/usr && make && make install

RUN echo "==> Thrift Installed!"

RUN echo "==> Installing Protobuf..."

RUN cd ~/ && git clone https://github.com/google/protobuf.git && cd protobuf/ && git checkout tags/v3.6.1 && ./autogen.sh && ./configure && make && make install && ldconfig

EXPOSE 6633 6653 6640

ENTRYPOINT [ "/docker-entry-point" ]
