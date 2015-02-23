# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "boxcutter/ubuntu1404-desktop"
  config.vm.network "public_network"
  config.vm.hostname = "htpc-vm"
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = true
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize 'post-boot', ["controlvm", :id, "setvideomodehint", "1280", "720", "24"]
  end

  # Fix missing default gateway
  config.vm.provision :shell, path: "scripts/fix_default_gw.sh"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "htpc-server.yml"
    ansible.groups = {"htpc-server" => ['default']}
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell, :inline => "sudo service lightdm restart"

end
