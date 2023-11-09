#!/bin/bash
# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

apt-get update
export DEBIAN_FRONTEND=noninteractive
apt install curl mingw-w64 binutils-mingw-w64 g++-mingw-w64 -y

#Metaisploit install
sleep 3
 MSF nightly framework installer
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
./msfinstall

#Sliver install
mkdir sliver
#One liner to download sliver server and client
# wget -O sliver-client_linux https://github.com/BishopFox/sliver/releases/latest/download/sliver-client_linux
# wget -O sliver-server_linux https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux

#sliver install
curl https://sliver.sh/install -o sliverc2.sh
chmod +x sliverc2.sh
./sliverc2.sh
systemctl status sliver --no-pager
exit