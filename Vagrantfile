# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECT_NAME = "Predictive 23.04 ENV"
BOX_REPO_URI = 'https://tc-build.telecontact.ru/artifact/repository/Vagrant.telecc/base-boxes'

Vagrant.configure("2") do |config|
  config.vm.box_url = "#{BOX_REPO_URI}/ubuntu-2304-amd64/lunar-server-cloudimg-amd64-vagrant.box"
  config.vm.box = "ubuntu-2304-amd64"

  config.vm.provider 'virtualbox' do |backend|
    backend.customize ['modifyvm', :id, '--groups', "/#{PROJECT_NAME} (testing)"]
    backend.memory = 512
    backend.cpus = 1
  end

  config.vm.provision "shell", path: "bootstrap.sh"
end
