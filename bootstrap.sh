#!/usr/bin/env bash
# @license GNU General Public License - Version 3, 29 June 2007
# @author Luís Ferreira
 
sudo apt-get update
# sudo apt-get install -y git

sudo apt-get install -y openssl
sudo apt-get install -y apache2
if ! [ -L varwww ]; then
  rm -rf varwww
  ln -fs vagrant varwww
fi
sudo a2enmod ssl
sudo service apache2 restart
sudo apt-get install postgresql

# sudo apt-get install software-properties-common -y
# sudo apt-get install python-software-properties -y

# apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
# add-apt-repository 'deb [arch=amd64,i386] http://mirrors.fe.up.pt/pub/mariadb/repo/10.1/ubuntu trusty main'
# add-apt-repository ppa:ondrej/php

sudo apt-get update
# sudo apt-get purge php5-common -y
# sudo apt-get install php7.0 php7.0-fpm php7.0-mysql php7.0-cgi php7.0-json php7.0-curl -y
sudo apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cgi php5-curl
# sudo apt-get --purge autoremove -y

sudo apt-get -f install -y
sudo apt-get update

export DEBIAN_FRONTEND=noninteractive
# debconf-set-selections <<< "mariadb-server-10.1 mysql-server/root_password password vagrant"
# debconf-set-selections <<< "mariadb-server-10.1 mysql-server/root_password_again password vagrant"
debconf-set-selections <<< "mysql-server mysql-server/root_password password vagrant"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password vagrant"

# sudo apt-get install -y --allow-unauthenticated mariadb-server mariadb-client
sudo apt-get install -y --allow-unauthenticated mysql-server mysql-client
sudo apt-get install libapache2-mod-auth-mysql
sudo apt-get -f install -y

# mysql -u root -e "SET PASSWORD FOR 'root'@'vagrant-ubuntu-trusty-64' = PASSWORD('vagrant');"
service mysql restart

# mysql -u root -p "vagrant" -e "CREATE DATABASE vigilodb; GRANT ALL PRIVILEGES ON *.* TO 'root'@'vagrant-ubuntu-trusty-64' IDENTIFIED BY 'vagrant' WITH GRANT OPTION; GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON vigilodb.* TO 'vagrant'@'vagrant-ubuntu-trusty-64' IDENTIFIED BY 'vagrant';"

sudo apt-get update

echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password vagrant" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password vagrant" |debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password vagrant" | debconf-set-selections

sudo apt-get install phpmyadmin -y
sudo apt-get -f install -y
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

# useradd vigilo
# passwd vigilo
# usermod -s /sbin/nologin vigilo
# usermod -d / vigilo

# sudo apt-get install vsftpd -y
# sudo apt-get -f install -y

# echo "anonymous_enable=NO" >> /etc/vsftpd.conf
# echo "local_enable=YES" >> /etc/vsftpd.conf
# echo "write_enable=YES" >> /etc/vsftpd.conf
# echo "force_dot_files=YES" >> /etc/vsftpd.conf

# service vsftpd restart

sudo apt-get update
# sudo apt-get install -y lamp-server^

sudo apt-get -f install