<style>
r { color: Red }
o { color: Orange }
g { color: Green }
b {color: Blue}
y {color: Yellow}
</style>



##  Deploying a LAMP Stack Web Application on AWS Cloud
A LAMP stack is a well-known software stack utilized for constructing and deploying web applications. The acronym "LAMP" encapsulates the essential elements of this stack:

**Linux** serves as the foundational operating system, chosen for its stability, security, and open-source characteristics. Commonly employed distributions in LAMP setups encompass Ubuntu, CentOS, and Amazon Linux.

__Apache__ functions as the web server software, responsible for serving and managing web requests. As an open-source and widely used web server, Apache adeptly handles both static and dynamic content.

__MySQL,__ a relational database management system (RDBMS), is employed for storing and managing the data of the application. Recognized for its reliability, performance, and user-friendly features, MySQL is a prevalent choice for database-driven web applications.

__PHP__, a server-side scripting language, is employed for crafting dynamic web pages. Embedded within HTML code and executed on the server, PHP generates dynamic content and interacts with the MySQL database to retrieve and manipulate data.

In summary, a LAMP stack furnishes a comprehensive and open-source environment for the development and hosting of web applications. Each constituent plays a distinct role:

- Linux provides the operating system.
- Apache serves as the web server.
- MySQL manages the relational database.
- PHP is responsible for server-side scripting and dynamic content generation.

This amalgamation is adaptable, widely embraced, and has served as the underpinning for numerous web applications across diverse industries. It empowers developers to fashion scalable and efficient web solutions using open-source technologies.

## Creation of EC2 Instance
Initially, I access AWS Cloud Services and generate an EC2 Ubuntu VM instance. During the instance creation process, opt for keypair authentication and save the private key (*.pem) to my local computer.
![ec2_creation](images/ec2_Lamp_created.png)
On windows terminal, I cd into the directory containing the downloaded private key.Run the below command to log into the instance via ssh:

ssh -i <private_keyfile.pem> username@ip-address

Successful login into ec2 instance:
![successful login into ec2](images/window_terminal_ec2_login.png)

## Setting Up Apache Web 

To launch the web application, it is necessary to install Apache using the Ubuntu package manager, apt:

### Updating Packages
```
sudo apt update

sudo apt install apache2 -y
```
![setting up apache server](<images/updating packages and installing apache server.png>)

```

#starting apache2 Server
sudo systemctl start apache2

#ensuring apache2 starts automatically on system boot
sudo systemctl enable apache2

#checking server spunned
sudo systemctl status apache2

```

![alt text](<images/checking apache status.png>)

If it shows a green text <g>**active (running)**</g>, it means the web server has been successfully spunned and is live.

## Configuring Security Group Inbound Rules on EC2 Instance

A Security group functions as a set of regulations serving as a virtual firewall for managing incoming (inbound traffic) and outgoing (outbound traffic) data to and from an instance.

Upon instance creation, there is an automatically established TCP rule on port 22, facilitating SSH connections to a terminal. To guarantee accessibility of my webpages on the internet, it is necessary I create an inbound TCP rule opening port 80.

![alt text](images/security_grp_config.png)

To check the accessiblity of my web server on the internet, I curl the IP address/DNS name of my localhost.

```
curl http://127.0.0.1:80  or curl http://localhost:80
```

![alt text](images/check_web_availability.png)

To see if my web application server can respond to requests , I use the public ip address of my instance on a web browser. http://<Public-IP-Address>:80
![alt text](images/Apache_page.png)

## Installing MySQL

I use MySQL as a relational database to store and manage data on my site.

Install mysql using the ```sudo apt install mysql-server -y``` command.

![alt text](images/mysql_installation.png)

Use the ```sudo mysql_secure_installation``` command to remove insecure default settings and enable protection for the database.


![alt text](images/mysql_secure_config.png)
![alt text](images/mysql_secure_config2.png)

It’s recommended that I run a security script that comes pre-installed with MySQL. This script will remove some insecure default settings and lock down access to database system. Before running the script I set a password for the root user, using <r>mysql_native_password</r> as default authentication method. I am defining this user’s password as Test0101


<r> ALTER USER </r> 'root'@'localhost' IDENTIFIED WITH <r>mysql_native_password</r> BY <g>'Test0101';</g>

![Alt text](images/mysql_passwd_config.png)

Exit the MySQL shell with:

mysql<r>></r> exit 


On successful secure configuration, Type:

 ```
 sudo mysql -p
 ``` 

 on the terminal to have access to the MySQL DB.

![alt text](images/mysql_logging.png)

I exit from the MySQL terminal by typing ```exit```.

## Installing PHP and its Modules

PHP serves as a programming language which is useful for dynamically displaying contents of the webpage to users who make requests to the webserver.

I need to install php alongside its modules, ```php-mysql``` which is php module that allows php to communicate with the mysql database, ```libapache2-mod-php``` which ensures that the apache web server handles the php contents properly.

```
sudo apt install -y php php-mysql libapache2-mod-php
```
![alt text](images/php_installation.png)

On successfull installation of php and its modules, I checked the version of the php to see if it was properly installed.

```
php -v
```

![alt text](images/php_version.png)

## ...........CREATING A VIRTUAL HOST FOR YOUR WEBSITE USING APACHE ......... ##

I will setup a virtual host to test the PHP script, virtual host enables you to setup multiple websites on a single server.

Create the directory for projectlamp using ‘mkdir’ command

```sudo mkdir /var/www/projectlamp```

Next, assign ownership of the directory with your current system user:

```sudo chown -R $USER:$USER /var/www/projectlamp```

Create and open a new configuration file in Apache’s sites-available directory.

And paste the below block of code
```
<VirtualHost *:80>
        ServerName projectlamp
        ServerAlias www.projectlamp
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/projectlamp
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

```sudo vi /etc/apache2/sites-available/projectlamp.conf```

![Alt text](images/apache_new_config_4_sites_available.png)

```
sudo ls /etc/apache2/sites-available
```
![Alt text](images/show_projectlamp.conf.png)

Let us enable the new virtual host with the a2ensite command:

```
sudo a2ensite projectlamp
```
![activating_New_virtualHost_config](images/activating_New_virtualHost_config.png)

I need to disable the default site with a2dissite command:
```
sudo a2dissite 000-default
```

I run the below command to check for syntax errors in the configuration file.
```
sudo apache2ctl configtest
```

I create an index file in the projectlamp folder with the command below:

```
sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html
```
Go to your browser and try to open your website URL using Public IP address:

```http://<Public-IP-Address>:80```

Prefarrably you can also use the DNS name, the port is optional as it defaults to 80.

```http://<Public-DNS-Name>:80```

The result from browser will be like below 
![index.html_view_4From_browser_via_IP_addr](images/index.html_view_4From_browser_via_IP_addr.png)

## .......Enable PHP on the Website....... ##


With the default DirectoryIndex settings on Apache, the index.html file takes precedence, lets modify this and give precedence to the index.php file.

We need to edit the <y>/etc/apache2/mods-enabled/dir.conf</y> file and change the order in which the index.php file is listed within the DirectoryIndex directive:

```
sudo nano /etc/apache2/mods-enabled/dir.conf
```

Paste the below command inside the nano pop-up
```
   <IfModule mod_dir.c>
        #Change this:
        #DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
        #To this:
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
    </IfModule>
```
Save and close the file, The Apache service needs to be restarted for the changes to take effect.

```
sudo systemctl reload apache2
```

Create a new file named index.php inside the projectlamp root folder with the below command:

```
sudo vim /var/www/projectlamp/index.php
```
And paste  this valid php code

```
<?php
phpinfo();
```

![php_Homepage](images/php_Homepage.png)
