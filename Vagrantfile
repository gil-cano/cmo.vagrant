# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.provision "shell", path: "LEMP.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8088
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
end
