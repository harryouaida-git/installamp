#!/bin/bash
# Interactive AMP Installer for Linux Mint (Apache, MariaDB, PHP)
# Author: Your Name
# Usage: sudo bash install_amp.sh

# Stop on errors
set -e

# Check root permissions
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root (use: sudo bash install_amp.sh)"
   exit 1
fi

echo "========================================="
echo " AMP Installer for Linux Mint"
echo " Apache, MariaDB, PHP"
echo "========================================="
echo

# Update system
read -p "Do you want to update the system first? (Y/n): " update_choice
update_choice=${update_choice:-Y}
if [[ "$update_choice" =~ ^[Yy]$ ]]; then
    apt update && apt upgrade -y
fi

# Install Apache
read -p "Install Apache Web Server? (Y/n): " apache_choice
apache_choice=${apache_choice:-Y}
if [[ "$apache_choice" =~ ^[Yy]$ ]]; then
    apt install apache2 -y
    systemctl enable apache2
    systemctl start apache2
    echo "Apache installed. Test in browser: http://localhost"
fi

# Install MariaDB
read -p "Install MariaDB (MySQL alternative)? (Y/n): " mariadb_choice
mariadb_choice=${mariadb_choice:-Y}
if [[ "$mariadb_choice" =~ ^[Yy]$ ]]; then
    apt install mariadb-server mariadb-client -y
    
    read -p "Run MariaDB secure installation now? (Y/n): " secure_choice
    secure_choice=${secure_choice:-Y}
    if [[ "$secure_choice" =~ ^[Yy]$ ]]; then
        mysql_secure_installation
    fi
fi

# Install PHP
read -p "Install PHP and MySQL support for PHP? (Y/n): " php_choice
php_choice=${php_choice:-Y}
if [[ "$php_choice" =~ ^[Yy]$ ]]; then
    apt install php libapache2-mod-php php-mysql -y
    php -v
fi

# Test PHP
read -p "Create PHP test file at /var/www/html/info.php? (Y/n): " phpfile_choice
phpfile_choice=${phpfile_choice:-Y}
if [[ "$phpfile_choice" =~ ^[Yy]$ ]]; then
    echo "<?php phpinfo(); ?>" > /var/www/html/info.php
    echo "Test PHP in browser: http://localhost/info.php"
fi

echo
echo "========================================="
echo "AMP Installation Complete!"
echo "Apache:   http://localhost"
echo "PHP Info: http://localhost/info.php"
echo "========================================="
