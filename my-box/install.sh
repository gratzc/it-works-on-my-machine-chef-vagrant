#!/usr/bin/env bash
echo "America/Chicago" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo ufw disable
sudo iptables -F
sudo cp -rf /vagrant/nginx /etc/
sudo rm -rf /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

sudo service nginx restart

sudo chmod 744 /vagrant/railo/railo.run

sudo /vagrant/railo/railo.run  --mode unattended --railopass myboxadmin --installconn false --bittype 64 --installiis no

sudo cp -rf /vagrant/railo/setenv.sh /opt/railo/tomcat/bin

sudo mkdir /opt/sites/CB203/admin/
sudo cp -rf /vagrant/railo/application.cfc /opt/sites/CB203/admin/
sudo cp -rf /vagrant/railo/admin.cfm /opt/sites/CB203/admin/
sudo cp -rf /vagrant/hosts /etc/hosts

mysql -uroot -pmyboxadmin -e 'create database if not exists CB203'

sudo service railo_ctl restart

sleep 10
sudo curl -i 'http://CB203.local/admin/admin.cfm'
sleep 10
sudo curl -i 'http://CB203.local/admin/admin.cfm'
sudo rm -R /opt/sites/CB203/admin/
