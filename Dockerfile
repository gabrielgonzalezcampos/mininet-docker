ARG BASE_IMAGE=ubuntu:18.04
FROM ${BASE_IMAGE}

USER root
WORKDIR /root

COPY  docker-entry-point /docker-entry-point

RUN apt-get update && apt-get install -y --no-install-recommends \
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
 
COPY install_thrift.sh  /install_thrift.sh

RUN apt-get update

RUN apt-get install -y build-essential git software-properties-common

RUN apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev \
	libboost-all-dev libevent-dev libtool flex bison pkg-config g++ libssl-dev \
	libnanomsg-dev libjudy-dev libreadline-dev valgrind libtool-bin libboost-dev \
	libboost-system-dev libboost-thread-dev
	
RUN apt-get install -y python3-pip python3-dev

RUN chmod +x /install_thrift.sh

RUN cd / && ./install_thrift.sh

COPY install_protobuf_grpc.sh  /install_protobuf_grpc.sh

RUN chmod +x /install_protobuf_grpc.sh

RUN cd / && ./install_protobuf_grpc.sh

COPY install_PI.sh  /install_PI.sh

RUN chmod +x /install_PI.sh

RUN cd / && ./install_PI.sh

COPY install_P4OvS.sh  /install_P4OvS.sh

RUN chmod +x /install_P4OvS.sh

RUN cd / && ./install_P4OvS.sh

EXPOSE 6633 6653 6640

ENTRYPOINT [ "/docker-entry-point" ]
