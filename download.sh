#!/bin/bash
sudo apt update
sudo apt install git -y
cd ~
git clone https://github.com/c02adaniel/linux_backup.git
chmod +x linux_backup/*.sh
sudo linux_backup/install.sh
