#!/bin/bash

yum update -y
yum install httpd -y
echo "<h1> Welcome to Burgasm Website </h1>" > /var/www/html/index.html
service httpd start
chkconfig httpd on