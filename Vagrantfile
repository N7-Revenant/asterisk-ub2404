# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECT_NAME = "Predictive 24.04 ENV"
BOX_REPO_URI = 'https://tc-build.telecontact.ru/artifact/repository/Vagrant.telecc/base-boxes'

Vagrant.configure("2") do |config|
  config.vm.box_url = "#{BOX_REPO_URI}/ubuntu-2404-amd64/index.json"
  config.vm.box = "ubuntu-2404-amd64"

  config.vm.provider 'virtualbox' do |machine|
    machine.name = "ub2404"
    machine.memory = 1024
    machine.cpus = 1
  end

  config.vm.define "ub2404" do |host|
    host.vm.hostname = "ub2404"
    host.vm.network "private_network", ip: "192.168.56.71"
  end

  config.vm.provision "shell", path: "bootstrap.sh"
end
