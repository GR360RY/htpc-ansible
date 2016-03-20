# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1404-desktop"
  config.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: "en0: Ethernet"
  config.vm.hostname = "htpc-server"
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = true
    # Enabled linked clones for version 1.8 and up
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    # 
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--ioapic", "On"]
    vb.customize ["modifyvm", :id, "--audio", "coreaudio"]
    vb.customize ["modifyvm", :id, "--audiocontroller", "ac97"]
    vb.customize 'post-boot', ["controlvm", :id, "setvideomodehint", "1280", "720", "24"]
  end

  # Workaround for fixing "==> default: stdin: is not a tty" warning.
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # If proxy configuration file available ( custom/01proxy ), configure apt-cacher-ng
  if File.exist?("./custom/01proxy") then
    config.vm.provision "shell", inline: "cp /vagrant/custom/01proxy /etc/apt/apt.conf.d/01proxy"
  end

  # Install apt-select to choose nearest ubuntu mirror
  config.vm.provision :shell, path: "scripts/vagrant_apt_select.sh"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "htpc-server.yml"
    ansible.groups = {"htpc-server" => ['default']}
    # When used with vagrant, place media files in .media directory under main project directory.
    # ansible.extra_vars = {
    #   htpc_media_path: "/vagrant/.media"
    # }
  end

end
