#!/usr/bin/env bash

# wget http://nginx.org/keys/nginx_signing.key
# apt-key add nginx_signing.key
# echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
# echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
# apt-get update
# apt-get install -y nginx

apt-get update

# Install the nginx web server
apt-get install -y nginx

# Install PHP fastCGI process manager
apt-get install -y php5-fpm

# Configure nginx to use the PHP Processor
cat << 'EOF' > /etc/nginx/sites-available/default
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                # With php5-cgi alone:
                #fastcgi_pass 127.0.0.1:9000;
                # With php5-fpm:
                fastcgi_pass unix:/var/run/php5-fpm.sock;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        location ~ /\.ht {
                deny all;
        }
}
EOF

# Restart servers
service nginx reload

# Create a PHP file to test configuration
cat << 'EOF' > /var/www/html/info.php
<?php
  phpinfo();
?>
EOF
