#!/bin/bash

yum update -y 
yum install httpd -y
echo "<h1> HELLO WORLD FROM TERRAFORM </h1>" > /var/www/html/index.html
service httpd start
chkconfig httpd on