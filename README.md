## htpc-ansible
HTPC Server Automation with XBMC, Bittorent and Usenet Software

## Overview
This ansible playbook is designed to quickly deploy home HTPC server, which can perform variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine, or on a different ones, and can be customized through single configuration file, correctly deploying all the software.

- [XBMC](http://xbmc.org/‎) - Open Source Home Theatre Software, with optional mysql backend support (can be used to manage single library for multiple XBMC clients at home)
- NAS configuration with support for sharing the library over NFS and CIFS
- [HTPC Manager](http://htpc.io) - combines all your favorite software into one slick interface
- [Couchpotato](https://couchpota.to/) - Download movies automatically
- [Sick Beard](http://sickbeard.com) - Internet PVR for your TV Shows
- [SABnzbd](http://sabnzbd.org/) - NZB capable binary newsgrabber
- [Deluge](http://deluge-torrent.org/) - Cross-platform BitTorrent client
- [nzbToMedia](https://github.com/clinton-hall/nzbToMedia) - postprocessing for CouchPotatoServer and SickBeard and etc.
- [Tvheadend](https://tvheadend.org/) - TV streaming server for Linux 

### Prerequisites

1. Machine designated for an HTPC with Ubuntu 14.04 Desktop installed.
2. Correctly working name resolution on home network or "Static IP" configured on Ubuntu.

## Quick installation

Login to your Ubuntu 14.04 machine using gui or console.

Open terminal and run:

```
wget --no-check-certificate https://raw.github.com/GR360RY/htpc-ansible/master/scripts/quickinstall.sh -O - | sh
```
	
__Reboot your machine following the installation.__

### What will be installed and configured ?

The following list of tasks will be performed during the installation:

* Install sshd service for remote access.
* Add 'xbmc' user identified by 'xbmc' password.
* Create movies, tv, music, pictures and downloads folders under /mnt/media
* Install latest XBMC version.
* Configure xbmc user to autologin automatically and start XBMC software.
* Enable Web Access to XBMC.
* Create XBMC mysql database and configure it to use correct Movies and TV Shows paths.
* Automatically configure scrappers for Movies and TV Sources
* Share folders under /mnt/media over CIFS ( for Windows Machines ) and over NFS ( for Linux based Machines )
* Install Deluge Daemon (Bittorent) or/and Sabnzbd(usenet). ( Sabnzbd will run on port 9000 )
* Install SickBeard and Couchpotato for grabbing TV Shows and Movies. 
* Install htpc-manager and configure all of the above service in htpc-manager.
* Setup apache as reverse proxy to allow access to htpc-manager on port 80.

All services ( besides Sabnzbd ) are configured with their default ports and settings, unless playbook has been modified.

## Customizing the setup

__Install Ansible and Git__

    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get -y install ansible git

__Clone the repository__

    git clone https://github.com/GR360RY/htpc-ansible.git
    cd htpc-ansible

__Edit Configuration__

Open `htpc-server.yml` in your favorite editor and update vars section.
Most commonly changed variables are available in the htpc-server.yml file.
All variables with detailed desription are located in each role README.md file:

* [XBMC Client Customisations](roles/xbmc-client/README.md)
* [XBMC MySQL Database Customisations](roles/xbmc-mysql/README.md)
* [NAS Customisations](roles/xbmc-nas/README.md)
* [Sabnzbd Customisations](roles/sabnzbd/README.md)
* [Deluge Customisations](roles/deluge/README.md)
* [SickBeard Customisations](roles/sickbeard/README.md)
* [CouchPotato Customisations](roles/couchpotato/README.md)
* [HTPC-Manager Customisations](roles/htpc-manager/README.md)

Run Ansible Playbook from your localhost:

    ansible-playbook -i hosts -c local -K htpc-server.yml


## Development and Testing with Vagrant

### Prerequisites

#### Install Vagrant
If you want to test out the configuration in VirtualMachine or contribute to htpc-ansible development,
download and install [Vagrant](http://www.vagrantup.com/)

Install [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)

#### Install snapshot plugin for Vagrant
We will use a [vagrant-multiprovider-snap](https://github.com/scalefactory/vagrant-multiprovider-snap) to roll machine back instead of recreating box from scratch.
```
vagrant plugin install vagrant-multiprovider-snap
```
### Deployment

#### Bringing up the machine

##### Bring up ubuntu desktop only
```
vagrant up --no-provision
```
##### Snapshot the machine.

```
vagrant snap take
```

#### Deploying htpc-ansible
```
vagrant provision
```

#### Reverting snapshot
In case you want to redeploy from scratch - simply revert the snapshot back to the machine with desktop installed.
```
vagrant snap rollback
```

#### Testing and configuring WEB services
Vagrant box is configured to have bridged eth1 interface.
All the web services can be tested and configured through [http://htpc-vm/](http://htpc-vm/)
