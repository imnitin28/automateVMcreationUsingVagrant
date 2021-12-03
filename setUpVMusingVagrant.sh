#!/bin/bash

# Create a workspace, and inside that create two sub directories(it could be n as well)
for i in centOS ubuntu; do mkdir -p workspace/$i; done
echo "============= workspace created =============="
cd workspace/ubuntu
#initialize your VM by mentioning box name
echo "============= Initializing vm using boxName ==============="
# replace boxname with box from vagrant-cloud
vagrant init ubuntu/trusty64
#run the initialized box.
echo "============= start and provision the vagrant environment ==============="
vagrant up
echo "=========== Current Vagrant version =============="
vagrant status --version
# cd to ubuntu, where Vagrant file is located and create index.html and bootstrap.sh
mkdir html
cat > ./html/index.html << EOF
<!DOCTYPE html>
<html>
  <body>
    <h1>Hello Knolders!</h1>
  </body>
</html>
EOF
echo "============= index.html created =============="
#Create bootstrap.sh
cat > ./bootstrap.sh << EOF
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
EOF
echo "============= bootstrap.sh created =============="
#Provision the VM by adding script to Vagrantfile
sed -i '62 i config.vm.provision :shell, path: "bootstrap.sh"' Vagrantfile > sed_out
echo "============= VM Provisioned with bootstrap.sh  =============="

# Reload Provisioning
vagrant reload --provision
echo "============= reloaded VM =============="

# ssh to your vm
echo "============= connect to your VM =================="
vagrant ssh -c 'wget -qO- 127.0.0.1'

#destroy VM
#vagrant destroy
