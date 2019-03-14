## The Specification of SuiteCRM

This document shows how to install the SuiteCRM on Ubuntu and Debian.

### Step 1: Getting Started

Update the source list and upgrade your system.
```bash
sudo apt-get update -y
sudo apt-get upgrade -y
```

Once your system bas been updated, restart the server.
```bash
sudo reboot
```

### Step2: Install LAMP stack
```bash
sudo apt-get install apache2 mariadb-server php7.0 php7.0-mysql php7.0-gd php7.0-curl php7.0-imap libapache2-mod-php7.0 php7.0-mcrypt php7.0-xml php7.0-json php7.0-zip -y
```

Update the values for post_max_size, update_max_filesize, max_input_time and memory_limit as follows:
```bash
sudo vim /etc/php/7.0/cli/php.ini
```

Change the following lines:
```
post_max_size = 64M
update_max_filesize = 64M
max_input_time = 120
memory_limit = 256M
```

Restart the apache web server.
```bash
sudo systemctl restart apache2
```

Enable the IMAP module.
```bash
sudo phpenmod imap
```

### Step3: Configure database
After installing the MariaDB, only can use the root user to login the db. By the way, the Mariadb root user has no password.

So, before configuring the database, we will need to secure MariaDB first.
```bash
sudo mysql_secure_installation
```
Answer all of the questions as shown below:
```
Set root password? [Y/n] Y
then input the password of root
Remove anonymous users? [Y/n] y
Disallow root login remotely? [Y/n] y
Remove test database and access to it? [Y/n] y
Reload privilege tables now? [Y/n] y
```

Login the database as root user.
```sql
create database suitecrm_db;
create user 'suitecrm' identified by 'password';
grant all privileges on suitecrm_db.* to 'suitecrm'@'localhost';
flush privileges;
exit;
```

### Step 4: Install SuiteCRM
Download the latest release version of SuiteCRM, we can download the release file on GitHub, check the link below:
[Latest Release](https://github.com/salesagility/SuiteCRM/releases)

```bash
unzip SuiteCRM-7.9.0.zip
sudo mv SuiteCRM-7.0.0 /var/www/html/suitecrm
sudo chown -R www-data:www-data /var/www/html/suitecrm
sudo chmod -R 777 /var/www/html/suitecrm
```

### Step 5: Configure Apache for SuiteCRM
```bash
sudo vim /etc/apache2/sites-available/suitecrm.conf
```

Add the following lines:
```xml
<VirtualHost *:80>
    ServerAdmin support@crmtimingfit.com
    DocumentRoot /var/www/html/suitecrm/
    ServerName crmtimingfit.com
    ServerAlias www.crmtimingfit.com
    <Directory /var/www/html/suitecrm/>
        Options FollowSymLinks
        AllowOverride All
    </Directory>
    ErrorLog /var/log/apache2/suitecrm-error_log
    CustomLog /var/log/apache2/suitecrm-access_log common
</VirtualHost>
```

Enable the site:
```bash
sudo a2ensite suitecrm
```

Finally, restart the apache web service.
```bash
sudo systemctl restart apache2
```
