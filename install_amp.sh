#!/bin/bash
# AMP Installer for Linux Mint (Apache, MariaDB, PHP)
# Author: Harry Ouaida
# Usage: sudo bash install_amp.sh

# Stop on errors
set -e

echo "Updating system..."
apt update && apt upgrade -y

echo "Installing Apache..."
apt install apache2 -y
systemctl enable apache2
systemctl start apache2

echo "Installing MariaDB..."
apt install mariadb-server mariadb-client -y
mysql_secure_installation <<EOF

Y
Y
Y
Y
EOF

echo "Installing PHP..."
apt install php libapache2-mod-php php-mysql -y

echo "Creating PHP test file..."
echo "<?php phpinfo(); ?>" > /var/www/html/info.php

echo "Restarting Apache..."
systemctl restart apache2

echo "Installation complete!"
echo "Test Apache:  http://localhost"
echo "Test PHP:     http://localhost/info.php"
