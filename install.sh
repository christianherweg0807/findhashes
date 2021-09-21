#!/bin/bash
cd /root
sed -i 's/ main/ main contrib non-free/' /etc/apt/sources.list
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install p7zip wget tmux linux-headers-$(uname -r)
DEBIAN_FRONTEND=noninteractive apt-get -t buster-backports -y install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-driver
modprobe nvidia
sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh.service
