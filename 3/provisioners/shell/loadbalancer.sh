#!/usr/bin/bash


yum install -y haproxy

cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orig

cat > /etc/haproxy/haproxy.cfg <<EOD
global
    daemon
    log 127.0.0.1 local2
    maxconn 256

defaults
    mode http
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms

frontend http-in
    bind *:80
    default_backend webservers

backend webservers
    balance roundrobin
    # Poor-man's sticky
    # balance source
    # JSP SessionID Sticky
    # appsession JSESSIONID len 52 timeout 3h
    option httpchk HEAD /ping
    option forwardfor
    option http-server-close
    server app1 192.168.1.11:8080 maxconn 32 check port 8081
    server app2 192.168.1.12:8080 maxconn 32 check port 8081

listen admin
    bind *:8080
    stats enable
EOD

systemctl enable haproxy
systemctl start haproxy
