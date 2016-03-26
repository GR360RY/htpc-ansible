# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Workaround for fixing "==> default: stdin: is not a tty" Vagrant warning.
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # If apt proxy configuration file available ( custom/01proxy ), configure apt-cacher-ng
  if File.exist?("./custom/01proxy") then
    config.vm.provision "shell", inline: "cp /vagrant/custom/01proxy /etc/apt/apt.conf.d/01proxy"
  end

  # Fix Internet provider trasparent proxy issues
  config.vm.provision "shell", inline: "cp /vagrant/scripts/vagrant_10broken_proxy /etc/apt/apt.conf.d/10broken_proxy"

  # Install apt-select to choose nearest ubuntu mirror
  #config.vm.provision :shell, path: "scripts/vagrant_apt_select.sh"

  config.vm.define "headless", primary: true do |headless|
    headless.vm.box = "ubuntu/trusty64"
    headless.vm.hostname = "htpc-server-vm"
    headless.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: "en0: Ethernet"
    headless.vm.provider "virtualbox" do |vb|
      # Enabled linked clones for version 1.8 and up
      vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
      vb.memory = 1024
      vb.cpus = 2
    end 
    headless.vm.provision :ansible do |ansible|
      ansible.playbook = "htpc-server.yml"
      ansible.groups = {"headless" => ['default']}
    end
  end

  config.vm.define "fullclient", autostart: false do |fullclient|
    fullclient.vm.box = "boxcutter/ubuntu1404-desktop"
    fullclient.vm.hostname = "htpc-vm"
    fullclient.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: "en0: Ethernet"
    fullclient.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
      vb.gui = true
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
      vb.customize ["modifyvm", :id, "--ioapic", "On"]
      vb.customize ["modifyvm", :id, "--audio", "coreaudio"]
      vb.customize ["modifyvm", :id, "--audiocontroller", "ac97"]
      vb.customize 'post-boot', ["controlvm", :id, "setvideomodehint", "1280", "720", "24"]
    end
    fullclient.vm.provision :ansible do |ansible|
      ansible.playbook = "htpc-server.yml"
      ansible.groups = {"fullclient" => ['default']}
    end
  end

end
