#!/usr/bin/env bash

wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
apt-get update
apt-get install -y nginx
