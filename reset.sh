#!/bin/sh

script_log_file="script_log.log"
green_color="\033[1;32m"
no_color="\033[0m"
domain="your_domain_name"

echo $no_color"REMOVING NGINX"
sudo service nginx stop >> $script_log_file 2>/dev/null
sudo apt-get purge nginx nginx-common nginx-full -y >> $script_log_file 2>/dev/null
sudo apt-get autoremove -y >> $script_log_file 2>/dev/null
sudo apt-get autoclean -y >> $script_log_file 2>/dev/null
sudo rm -rf /etc/nginx >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"REMOVING PHP"
sudo apt-get purge php8.0* -y >> $script_log_file 2>/dev/null
sudo apt-get autoremove -y >> $script_log_file 2>/dev/null
sudo apt-get autoclean -y >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"REMOVING COMPOSER"
sudo rm -rf /usr/local/bin/composer >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"REMOVING MYSQL"
sudo service mysql stop >> $script_log_file 2>/dev/null
sudo apt-get purge mysql-server mysql-client -y >> $script_log_file 2>/dev/null
sudo apt-get autoremove -y >> $script_log_file 2>/dev/null
sudo apt-get autoclean -y >> $script_log_file 2>/dev/null
sudo rm -rf /var/lib/mysql >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"REMOVING phpMyAdmin"
sudo apt-get purge phpmyadmin -y >> $script_log_file 2>/dev/null
sudo rm -rf /usr/share/phpmyadmin >> $script_log_file 2>/dev/null
sudo rm -rf /var/www/html/$domain/public/phpmyadmin >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"REMOVING CERTBOT"
sudo apt-get purge certbot -y >> $script_log_file 2>/dev/null
sudo snap remove certbot >> $script_log_file 2>/dev/null
sudo rm -rf /etc/letsencrypt >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $no_color"CLEANING UP"
sudo apt-get autoremove -y >> $script_log_file 2>/dev/null
sudo apt-get autoclean -y >> $script_log_file 2>/dev/null
echo $green_color"[SUCCESS]";
echo $green_color"[######################################]";

echo $green_color"REMOVAL COMPLETE";
echo $green_color"[######################################]";
