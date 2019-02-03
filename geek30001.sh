apt install unzip && geekcash-cli stop
cd /root/.geekcash
rm -rf blo* && rm -rf chai*
wget https://github.com/GeekCash/geekcash/releases/download/v1.2.0.1/bootstrap.zip
unzip boo*.zip && rm boot*.zip 
geekcashd -daemon
watch geekcash-cli getinfo
