#!/bin/bash
dnf update
dnf install mariadb-server net-tools -y
sudo systemctl enable --now mariadb
mysql -u root -e "CREATE DATABASE Inova"
mysql -u root -e "CREATE USER 'dba'@'%' IDENTIFIED BY 'dba';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'dba'@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"
mysql Inova < /vagrant/Inova.sql
#Atribuindo um ip fixo via linha de comando
nmcli connection modify "System eth1" ipv4.addresses 10.0.19.65/24 ipv4.gateway 10.0.19.1 ipv4.method manual
sudo nmcli connection down "System eth1" && sudo nmcli connection up "System eth1"



