#!/bin/bash
apt-get update
apt install mariadb-server net-tools -y
systemctl enable --now mariadb
mysql -u root -e "CREATE DATABASE MeuBanco"
mysql -u root -e "CREATE USER 'dba'@'%' IDENTIFIED BY 'P@ssw0rd';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'dba'@'%' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'dba'@'localhost' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"