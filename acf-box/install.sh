#!/usr/bin/env bash
echo "America/Chicago" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo ufw disable
sudo iptables -F

sudo cp -rf /vagrant/hosts /etc/hosts

mysql -uroot -pmyboxadmin -e 'create database if not exists CB203'
