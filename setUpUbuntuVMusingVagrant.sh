#!/bin/bash

# Create a workspace, and inside that create two sub directories(it could be n as well)
for i in centOS ubuntu; do mkdir -p workspace/$i; done
cd ubuntu
#initialize your VM by mentioning box name
vagrant init ubuntu/trusty64 
#run the initialized box.
vagrant up
