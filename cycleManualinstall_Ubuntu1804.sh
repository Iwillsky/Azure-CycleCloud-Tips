#!/bin/bash

##install CycleCloud VM on Ubuntu

#install CycleCloud VM on ubuntu
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
java -version

sudo apt update 
sudo apt -y install wget gnupg2
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo echo 'deb https://packages.microsoft.com/repos/cyclecloud bionic main' > /etc/apt/sources.list.d/cyclecloud.list 
sudo apt update 
sudo apt -y install cyclecloud8

##Then use web browser open http://your-cycle-server-ip:8080, complete the next config step