#!/usr/bin/bash


yum install -y /vagrant/packages/etcd-0.4.6-7.el7.centos.x86_64.rpm

cp /etc/etcd/etcd.conf /etc/etcd/etcd.conf.orig

ipaddress=`facter ipaddress_enp0s8`

cat > /etc/etcd/etcd.conf <<EOD
addr = "$ipaddress:4001"
bind_addr = "$ipaddress:4001"
EOD

systemctl enable etcd
systemctl start etcd
