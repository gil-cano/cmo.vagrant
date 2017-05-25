# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.provision "shell", path: "LEMP.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8088
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.network "private_network", ip: "33.33.33.10", type: "dhcp", auto_config: false
end
