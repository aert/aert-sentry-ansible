# -*- mode: ruby; -*-
# vi: set ft=ruby :

# Installer local path <without> extension
INSTALLER_VERSION = "6.3.3"
INSTALLER_PATH = File.join(File.dirname(__FILE__), "build", "setup_sentry-" + INSTALLER_VERSION)

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Network
  config.vm.network :private_network, ip: "192.168.111.225"
  config.vm.hostname = "sentry.vagrant.local"
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  #config.vm.synced_folder "../", "/home/vagrant/PROJECT"

  # Provision
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.inventory_path = "ansible/inventory.ini"
    extra_vars = { 
                    app_servername: "192.168.111.225",
                    installer_local: INSTALLER_PATH
                 }
    ansible.raw_arguments = "--extra-vars=" + extra_vars.map { |k,v| "#{k}=#{v}" }.join(" ")
  end

  # Customize the box
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 512, "--name", "sentry"]
  end

end

