#apt-get update
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:libccd-debs/ppa
#apt-get update
#apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev libboost-all-dev libevent-dev libtool flex bison pkg-config g++ libssl-dev libnanomsg-dev libjudy-dev libreadline-dev valgrind libtool-bin libboost-dev libboost-system-dev libboost-thread-dev
#apt-get install -y python3-pip python3-dev
pip3 install nnpy
echo "== Thrift =="
git clone https://github.com/apache/thrift
cd thrift && git checkout v0.13.0 && ./bootstrap.sh && ./configure --prefix=/usr && make && make install