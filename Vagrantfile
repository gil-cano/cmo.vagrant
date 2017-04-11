# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/jessie64"

  # config.vm.provision "shell", path: "nginx.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8088
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get install -y mysql-server
  #   sudo apt-get install -y php5-fpm php5-mysql
  # SHELL

  # sudo nano /etc/php5/fpm/php.ini
  # cgi.fix_pathinfo=0
  # sudo service php5-fpm restart
  # https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-debian-8
end
