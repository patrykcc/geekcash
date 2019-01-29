#GEEKCASH MultiMN

#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the GEEKCash Automated Install, During this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See a lot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a GEEKCash Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo "Creating 4 GEEKCash system users with no-login access:"
sudo adduser --system --home /home/geekcash geekcash
sudo adduser --system --home /home/geekcash2 geekcash2
sudo adduser --system --home /home/geekcash3 geekcash3
sudo adduser --system --home /home/geekcash4 geekcash4
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/geekcash
cd /root/geekcash
wget https://github.com/GeekCash/geekcash/releases/download/v1.2.0.1/geekcash-1.2.0-x86_64-linux-gnu.tar.gz
tar -xzvf geekcash-1.2.0-x86_64-linux-gnu.tar.gz
sudo mv /root/geekcash/geekcash-1.2.0/bin/geekcashd /root/geekcash/geekcash-1.2.0/bin/geekcash-cli /root/geekcash/geekcash-1.2.0/bin/geekcash-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/geekcash*
echo -e "${GREEN}Updating blockchain to pass 300001 block${NC}"
wget https://github.com/GeekCash/geekcash/releases/download/v1.2.0.1/bootstrap.zip
unzip bootstrap.zip -d /home/geekcash/.geekcash
unzip bootstrap.zip -d /home/geekcash2/.geekcash
unzip bootstrap.zip -d /home/geekcash3/.geekcash
unzip bootstrap.zip -d /home/geekcash4/.geekcash
rm bootstrap.zip
echo -e "${GREEN}Configuring Wallet for first node${NC}"
#sudo mkdir /home/geekcash/.geekcash
sudo touch /home/geekcash/.geekcash/geekcash.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/geekcash/.geekcash/geekcash.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/geekcash/.geekcash/geekcash.conf
echo "rpcallowip=127.0.0.1" >> /home/geekcash/.geekcash/geekcash.conf
echo "server=1" >> /home/geekcash/.geekcash/geekcash.conf
echo "daemon=1" >> /home/geekcash/.geekcash/geekcash.conf
echo "maxconnections=250" >> /home/geekcash/.geekcash/geekcash.conf
echo "masternode=1" >> /home/geekcash/.geekcash/geekcash.conf
echo "rpcport=6890" >> /home/geekcash/.geekcash/geekcash.conf
echo "listen=0" >> /home/geekcash/.geekcash/geekcash.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):6889" >> /home/geekcash/.geekcash/geekcash.conf
echo "masternodeprivkey=$privkey" >> /home/geekcash/.geekcash/geekcash.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
#sudo mkdir /home/geekcash2/.geekcash
sudo touch /home/geekcash2/.geekcash/geekcash.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/geekcash2/.geekcash/geekcash.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/geekcash2/.geekcash/geekcash.conf
echo "rpcallowip=127.0.0.1" >> /home/geekcash2/.geekcash/geekcash.conf
echo "server=1" >> /home/geekcash2/.geekcash/geekcash.conf
echo "daemon=1" >> /home/geekcash2/.geekcash/geekcash.conf
echo "maxconnections=250" >> /home/geekcash2/.geekcash/geekcash.conf
echo "masternode=1" >> /home/geekcash2/.geekcash/geekcash.conf
echo "rpcport=6891" >> /home/geekcash2/.geekcash/geekcash.conf
echo "listen=0" >> /home/geekcash2/.geekcash/geekcash.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):6889" >> /home/geekcash2/.geekcash/geekcash.conf
echo "masternodeprivkey=$privkey2" >> /home/geekcash2/.geekcash/geekcash.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
#sudo mkdir /home/geekcash3/.geekcash
sudo touch /home/geekcash3/.geekcash/geekcash.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/geekcash3/.geekcash/geekcash.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/geekcash3/.geekcash/geekcash.conf
echo "rpcallowip=127.0.0.1" >> /home/geekcash3/.geekcash/geekcash.conf
echo "server=1" >> /home/geekcash3/.geekcash/geekcash.conf
echo "daemon=1" >> /home/geekcash3/.geekcash/geekcash.conf
echo "maxconnections=250" >> /home/geekcash3/.geekcash/geekcash.conf
echo "masternode=1" >> /home/geekcash3/.geekcash/geekcash.conf
echo "rpcport=6892" >> /home/geekcash3/.geekcash/geekcash.conf
echo "listen=0" >> /home/geekcash3/.geekcash/geekcash.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):6889" >> /home/geekcash3/.geekcash/geekcash.conf
echo "masternodeprivkey=$privkey3" >> /home/geekcash3/.geekcash/geekcash.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
#sudo mkdir /home/geekcash4/.geekcash
sudo touch /home/geekcash4/.geekcash/geekcash.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/geekcash4/.geekcash/geekcash.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/geekcash4/.geekcash/geekcash.conf
echo "rpcallowip=127.0.0.1" >> /home/geekcash4/.geekcash/geekcash.conf
echo "server=1" >> /home/geekcash4/.geekcash/geekcash.conf
echo "daemon=1" >> /home/geekcash4/.geekcash/geekcash.conf
echo "maxconnections=250" >> /home/geekcash4/.geekcash/geekcash.conf
echo "masternode=1" >> /home/geekcash4/.geekcash/geekcash.conf
echo "rpcport=6893" >> /home/geekcash4/.geekcash/geekcash.conf
echo "listen=0" >> /home/geekcash4/.geekcash/geekcash.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):6889" >> /home/geekcash4/.geekcash/geekcash.conf
echo "masternodeprivkey=$privkey4" >> /home/geekcash4/.geekcash/geekcash.conf
sleep 5 
fi
echo "Syncing first node, please wait...";
geekcashd -datadir=/home/geekcash/.geekcash -daemon
sleep 10 
until geekcash-cli -datadir=/home/geekcash/.geekcash mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
geekcashd -datadir=/home/geekcash2/.geekcash -daemon
sleep 10 
until geekcash-cli -datadir=/home/geekcash2/.geekcash mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
geekcashd -datadir=/home/geekcash3/.geekcash -daemon
sleep 10 
until geekcash-cli -datadir=/home/geekcash3/.geekcash mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
geekcashd -datadir=/home/geekcash4/.geekcash -daemon
sleep 10 
until geekcash-cli -datadir=/home/geekcash4/.geekcash mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You fourth masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your GEEKCash Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
echo "If you found this helpful, please donate GEEK to GN2nt5horreKV27MRmgarsePzSR32B6jt8"
