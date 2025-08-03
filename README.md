# Install AMP

Install AMP (Apache, MariaDB, PHP) on Linux Mint – Beginner Guide

## Update system:
sudo apt update && sudo apt upgrade -y

## Install Apache:

sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

Test in browser: http://localhost

## Install MariaDB:

sudo apt install mariadb-server mariadb-client -y
sudo mysql_secure_installation
Set root password (optional)
Remove anonymous users: Y
Disallow remote root login: Y
Remove test database: Y
Reload privileges: Y

## Install PHP:

sudo apt install php libapache2-mod-php php-mysql -y
php -v
Test PHP:
sudo nano /var/www/html/info.php
Insert: <?php phpinfo(); ?>
Save and exit (CTRL+O, Enter, CTRL+X)
Open in browser: http://localhost/info.php

## Done:
You now have Apache, MariaDB, and PHP installed.
Next steps: Try WordPress, learn PHP/MySQL, create a local site.
