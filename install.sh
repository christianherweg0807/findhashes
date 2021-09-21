#!/bin/bash
cd /root
sed -i 's/ main/ main contrib non-free/' /etc/apt/sources.list
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install p7zip wget tmux linux-headers-$(uname -r)
DEBIAN_FRONTEND=noninteractive apt-get -t buster-backports -y install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-driver
modprobe nvidia
sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart ssh.service
wget -O /tmp/hashcat.7z https://github.com/hashcat/hashcat/releases/download/v6.2.4/hashcat-6.2.4.7z
7zr x /tmp/hashcat.7z
ln -s hashcat-* hashcat
