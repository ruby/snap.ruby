# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provision "shell", inline: <<-SHELL
    apt update -qy
    apt install -qy snapcraft
  SHELL
end
