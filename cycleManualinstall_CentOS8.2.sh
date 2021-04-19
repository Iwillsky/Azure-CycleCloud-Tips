#!/bin/bash

##install CycleCloud VM on CentOS

sudo su
yum install java-1.8.0-openjdk.x86_64 python3 -y
java -version

cat > /etc/yum.repos.d/cyclecloud.repo <<EOF
[cyclecloud]
name=cyclecloud
baseurl=https://packages.microsoft.com/yumrepos/cyclecloud
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
vi /etc/yum.repos.d/cyclecloud.repo
yum -y install cyclecloud8
netstat -ntlp

##Then use web browser open http://your-cycle-server-ip:8080, complete the next config step