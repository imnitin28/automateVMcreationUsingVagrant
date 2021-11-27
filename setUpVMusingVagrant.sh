#!/bin/bash

# Create a workspace, and inside that create two sub directories(it could be n as well)
for i in centOS ubuntu; do mkdir -p workspace/$i; done
echo "============= workspace created =============="
cd workspace/ubuntu
#initialize your VM by mentioning box name
echo "============= Initializing vm using ubuntu box ==============="
vagrant init ubuntu/trusty64 
#run the initialized box.
echo "============= start and provision the vagrant environment =================="
vagrant up
echo "=========== Current Vagrant version =============="
vagrant status --version
# ssh to your vm
echo "============= connect to your VM =================="
vagrant ssh