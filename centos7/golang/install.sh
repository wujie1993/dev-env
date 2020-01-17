#!/bin/sh

yum install wget -y

wget -q https://dl.google.com/go/go1.13.6.linux-amd64.tar.gz -O /tmp/go1.13.6.linux-amd64.tar.gz
tar -C /usr/local -xzf /tmp/go1.13.6.linux-amd64.tar.gz

sed -i '/export PATH=\$PATH:\/usr\/local\/go\/bin:\/root\/go\/bin/d' /etc/profile
sed -i '/export GOPATH=\/root\/go/d' /etc/profile

sed -i '$a export PATH=\$PATH:\/usr\/local\/go\/bin:\/root\/go\/bin' /etc/profile
sed -i '$a export GOPATH=\/root\/go' /etc/profile

source /etc/profile
