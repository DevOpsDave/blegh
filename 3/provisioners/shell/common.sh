#!/usr/bin/bash


yum install -y multitail tmux nmap yum-cron vim nohup rsync haproxy

systemctl stop firewalld
systemctl disable firewalld
