# Install AMP (Apache, MariaDB, PHP) on Linux Mint – Beginner Guide

This guide explains how to manually install an AMP stack on Linux Mint.  
AMP stands for **Apache** (web server), **MariaDB** (database), and **PHP** (server-side scripting).  
On Linux, this setup is also called **LAMP** (Linux, Apache, MariaDB/MySQL, PHP).

---

## 1. Update the System  
Open the terminal and run:  
`sudo apt update && sudo apt upgrade -y`

---

## 2. Install Apache  
Run the following commands:  
`sudo apt install apache2 -y`  
`sudo systemctl enable apache2`  
`sudo systemctl start apache2`  

Test Apache by opening your browser and navigating to:  
`http://localhost`  

You should see the Apache default welcome page.

---

## 3. Install MariaDB  
Run:  
`sudo apt install mariadb-server mariadb-client -y`  
Then secure the installation:  
`sudo mysql_secure_installation`  

Recommended answers for beginners:  
- Set root password: Optional (press Enter to skip)  
- Remove anonymous users: `Y`  
- Disallow remote root login: `Y`  
- Remove test database: `Y`  
- Reload privilege tables: `Y`

---

## 4. Install PHP  
Run:  
`sudo apt install php libapache2-mod-php php-mysql -y`  
Check PHP version:  
`php -v`

---

## 5. Test PHP  
Create a test PHP file by running:  
`sudo nano /var/www/html/info.php`  

Add the following line exactly:  
`<?php phpinfo(); ?>`  

Save and exit by pressing **CTRL+O**, then **Enter**, then **CTRL+X**.  

Open your browser and visit:  
`http://localhost/info.php`  

You should see the PHP information page.

---

## 6. Done!  
You now have:  
- Apache (web server)  
- MariaDB (database server)  
- PHP (server-side scripting language)  

### Next Steps:  
- Install WordPress or other web applications  
- Learn PHP and MySQL basics  
- Build your first local website

---

## Security Note  
This guide is intended for **local development only**. For public-facing servers, you should configure additional security measures.
