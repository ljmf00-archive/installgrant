# -*- mode: ruby -*-
# vi: set ft=ruby :
# @author Luís Ferreira
# @license GNU General Public License - Version 3, 29 June 2007

vagrant_dir = File.expand_path(File.dirname(__FILE__))

Vagrant.configure(2) do |config|
  vagrant_version = Vagrant::VERSION.sub(/^v/, '')

  config.vm.provider :virtualbox do |vm|
    vm.customize ["modifyvm", :id, "--memory", 512]
    vm.customize ["modifyvm", :id, "--cpus", 1]
    vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vm.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provider :parallels do |v|
    v.update_guest_tools = true
    v.customize ["set", :id, "--longer-battery-life", "off"]
    v.memory = 512
    v.cpus = 1
  end

  config.vm.provider :vmware_fusion do |v|
    v.vmx["memsize"] = "512"
    v.vmx["numvcpus"] = "1"
  end

  config.vm.provider :hyperv do |v, override|
    v.memory = 512
    v.cpus = 1
  end

  config.ssh.forward_agent = true
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider :parallels do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box = "netsensia/ubuntu-trusty64"
  end

  config.vm.provider :vmware_workstation do |v, override|
    override.vm.box = "netsensia/ubuntu-trusty64"
  end

  config.vm.provider :hyperv do |v, override|
    override.vm.box = "ericmann/trusty64"
  end

  config.vm.hostname = "installgrant"

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
  # config.vm.network "forwarded_port", guest: 111, host: 111
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.synced_folder "www/", "/var/www"
endHello
Hello
