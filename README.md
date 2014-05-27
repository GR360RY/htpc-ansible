# htpc-ansible
HTPC Server Automation with XBMC and Newsgroups Software

# Overview
This ansible playbook is designed to quickly deploy home HTPC server, which can perform variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine, or on a different ones, and can be customized through single configuration file, correctly deploying all the software.

- [XBMC - Open Source Home Theatre Software](http://xbmc.org/‎), with optional mysql backend support (can be used to manage single library from multiple XBMC servers at home)
- NAS configuration with support for sharing the library over NFS and CIFS (AFP to come)
- [HTPC Manager - combines all your favorite software into one slick interface](http://htpc.io)
- [Couchpotato - download movies automatically](https://couchpota.to/)
- [SABnzbd - NZB capable binary newsgrabber](http://sabnzbd.org/)
- [Sick Beard - Internet PVR for your TV Shows](http://sickbeard.com)

# Installation

## Prerequisites

1. Machine designated for an HTPC with Ubuntu 14.04 Desktop installed
2. htpc-ansible playbook requires [ansible](http://www.ansible.com/) installed on a machine, from which deployment is run. Installation instructions are [here](http://docs.ansible.com/intro_installation.html)

## Quick installation

### From an HTPC itself
```bash
sudo apt-get -y install ansible git
git clone https://github.com/GR360RY/htpc-ansible
cd htpc-ansible
echo -e  "[xbmc-server]\n127.0.0.1" >! hosts
ansible-playbook -i hosts -K xbmc-client-server.yml --connection=local
```

### From another machine

This requires SSH daemon to be up on HTPC machine. Installation can be performed with regular user (sudo password will be required) or root.

```bash
git clone https://github.com/GR360RY/htpc-ansible
cd htpc-ansible
ADDR=___HTPC_ADDR_OR_HOSTNAME___ echo "[xbmc-server]\n${ADDR}" > hosts
ansible-playbook -i hosts -K --user ___USERNAME___ --ask-pass xbmc-client-server.yml
```

## Customizing the setup
To customize the setup - edit xbmc-client-server.yml

# Default configuration settings
All packages are configured with their default ports and settings, unless xbmc-client-server.yml has been modified.

# Development and testing

## Prerequisites

### Install Vagrant
If you want to test out the configuration in VirtualMachine, or contribute to htpc-ansible development,
download and install [Vagrant](http://www.vagrantup.com/)

Install [Oracle VM VirtualBox Extension Pack](http://download.virtualbox.org/virtualbox/4.3.10/Oracle_VM_VirtualBox_Extension_Pack-4.3.10-93012.vbox-extpack)

### Install snapshot plugin for Vagrant
We will use a [vagrant-multiprovider-snap](https://github.com/scalefactory/vagrant-multiprovider-snap) to roll machine back instead of recreating box from scratch.
```
vagrant plugin install vagrant-multiprovider-snap
```
## Deployment

### Bringing up the machine

#### Bring up ubuntu desktop only
```
vagrant up --no-provision
```
#### Snapshot the machine.

```
vagrant snap take
```

### Deploying htpc-ansible
```
vagrant provision
```

### Reverting snapshot
In case you want to redeploy from scratch - simply revert the snapshot back to the machine with desktop installed.
```
vagrant snap rollback
```

### Testing and configuring WEB services
Vagrant box creates private network, with xbmc server available at <b>172.30.30.30</b>.
All the web services can be tested and configured through this address.
