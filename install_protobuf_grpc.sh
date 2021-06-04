#apt-get update
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:libccd-debs/ppa
#apt-get update
#apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev libboost-all-dev libevent-dev libtool flex bison pkg-config g++ libssl-dev libnanomsg-dev libjudy-dev libreadline-dev valgrind libtool-bin libboost-dev libboost-system-dev libboost-thread-dev
#apt-get install -y python3-pip python3-dev
git clone https://github.com/google/protobuf.git
cd protobuf/ && git checkout tags/v3.6.1 && ./autogen.sh && ./configure && make && make install && ldconfig
cd ..
git clone https://github.com/google/grpc.git
cd grpc/ && git checkout tags/v1.17.2 && git submodule update --init --recursive && make && make install && ldconfig