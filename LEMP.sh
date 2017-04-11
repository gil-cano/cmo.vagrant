#!/usr/bin/env bash

# wget http://nginx.org/keys/nginx_signing.key
# apt-key add nginx_signing.key
# echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
# echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

echo "Provisioning virtual machine..."
apt-get update

# Install the nginx web server
apt-get install -y nginx

# Install PHP fastCGI process manager
apt-get install -y php5-fpm

# Make fpm more secure
sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
service php5-fpm restart

# Configure nginx to use the PHP Processor
cp /vagrant/config/nginx_vhost /etc/nginx/sites-available/default
service nginx reload

# Create a PHP file to test configuration
cat << 'EOF' > /var/www/html/info.php
<?php
  phpinfo();
?>
EOF
