#apt-get update
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:libccd-debs/ppa
#apt-get update
#apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev libboost-all-dev libevent-dev libtool flex bison pkg-config g++ libssl-dev libnanomsg-dev libjudy-dev libreadline-dev valgrind libtool-bin libboost-dev libboost-system-dev libboost-thread-dev
#apt-get install -y python3-pip python3-dev
echo "== P4-OvS =="
git clone https://github.com/simula/P4-OvS
cd P4-OvS && git remote add upstream https://github.com/osinstom/P4-OvS.git && git checkout dreibh/build-fix-16Dec2020 && ./boot.sh && ./configure && make