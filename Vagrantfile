# -*- mode: ruby; -*-
# vi: set ft=ruby :

# Installer local path <without> extension
INSTALLER_VERSION = "6.3.3"
INSTALLER_PATH = File.join(File.dirname(__FILE__), "build", "setup_sentry-" + INSTALLER_VERSION)

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  # Network
  config.vm.network :private_network, ip: "192.168.55.99"
  config.vm.hostname = "sentry.vagrant.local"
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  # Provision
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.host_key_checking = false
    ansible.raw_ssh_args = ['-o ControlMaster=no']
    # ansible.verbose = 'vvvv'

    ansible.extra_vars = {
      ansible_ssh_user: 'vagrant',
      app_servername: "sentry.tsar.su",
    }
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 512, "--name", "sentry"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

end
