#!/bin/bash
sudo apt-get -y update
wget https://download.virtualbox.org/virtualbox/6.1.8/Oracle_VM_VirtualBox_Extension_Pack-6.1.8.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.8.vbox-extpack
echo "============= Virtual box installed =================="
sudo apt-get -y update
