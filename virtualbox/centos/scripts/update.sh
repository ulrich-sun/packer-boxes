#!/bin/bash
#Bypass EOL
sudo sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
sudo sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
sudo sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

# Update OS
sudo yum -y update
sudo yum -y install epel-release

# #Install Ansible
# sudo yum install -y python3 git sshpass
# curl -sS https://bootstrap.pypa.io/pip/3.6/get-pip.py | sudo python3
# /usr/local/bin/pip3 install ansible
