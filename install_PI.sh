#apt-get update
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:libccd-debs/ppa
#apt-get update
#apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev libboost-all-dev libevent-dev libtool flex bison pkg-config g++ libssl-dev libnanomsg-dev libjudy-dev libreadline-dev valgrind libtool-bin libboost-dev libboost-system-dev libboost-thread-dev
#apt-get install -y python3-pip python3-dev

echo "== PI =="
apt install -y libnanomsg-dev libgrpc++-dev libgrpc-dev libgc-dev
git clone https://github.com/osinstom/PI
cd PI && git checkout p4-ovs && git submodule update --init --recursive && ./autogen.sh && \
	./configure --prefix=/usr --with-proto --with-fe-cpp --with-cli --with-internal-rpc --with-gnu-ld && \
	make && make install