## htpc-ansible
HTPC Server Automation with XBMC, Bittorent and Usenet Software

## Overview
This ansible playbook is designed to quickly deploy home HTPC server, which can perform variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine, or on a different ones, and can be customized through single configuration file, correctly deploying all the software.

- [XBMC - Open Source Home Theatre Software](http://xbmc.org/‎), with optional mysql backend support (can be used to manage single library from multiple XBMC servers at home)
- NAS configuration with support for sharing the library over NFS and CIFS (AFP to come)
- [HTPC Manager - combines all your favorite software into one slick interface](http://htpc.io)
- [Couchpotato - download movies automatically](https://couchpota.to/)
- [Sick Beard - Internet PVR for your TV Shows](http://sickbeard.com)
- [SABnzbd - NZB capable binary newsgrabber](http://sabnzbd.org/)
- [Deluge -  Cross-platform BitTorrent client](http://deluge-torrent.org/)

### Prerequisites

1. Machine designated for an HTPC with Ubuntu 14.04 Desktop installed.
2. Correctly working name resolution on home network or "Static IP" configured on Ubuntu.

## Quick installation

Login to your Ubuntu 14.04 machine using gui or console.
Open terminal and run __one__ of the below commands:

Install HTPC Server with Bittorent Downloader ( Deluge )
```
wget --no-check-certificate https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server-torrents.sh -O - | sh
```
Install HTPC Server with Usenet Downloader ( Sabnzbd )
```
wget --no-check-certificate https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server-usenet.sh -O - | sh
```
Install HTPC Server with both Bittorent and Usenet Downloaders
```
wget --no-check-certificate https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server.sh -O - | sh
```
	
__Reboot your machine following the installation.__

## What will be installed and configured ?

The following list of tasks will be performed during the installation:

* Install sshd service for remote access.
* Add 'xbmc' user identified by 'xbmc' password.
* Create Movies, TV and Downloads folders under /mnt/xbmc
* Install latest XBMC version.
* Configure xbmc user to autologin automatically and start XBMC software.
* Enable Web Access to XBMC.
* Create XBMC mysql database and configure it to use correct Movies and TV Shows paths.
* Automatically configure scrappers for Movies and TV Sources
* Share folders under /mnt/xbmc over CIFS ( for Windows Machines ) and over NFS ( for Linux based Machines )
* Install Deluge Daemon (Bittorent) or/and Sabnzbd(usenet). ( Sabnzbd will run on port 9000 )
* Install SickBeard and Couchpotato for grabbing TV Shows and Movies. 
* Install htpc-manager and configure all of the above service in htpc-manager.
* Setup apache as reverse proxy to allow access to htpc-manager on port 80.

All services ( besides Sabnzbd ) are configured with their default ports and settings, unless playbook has been modified.

## Customizing the setup

* [XBMC Client Customisations](roles/xbmc-client/README.md)
* [XBMC MySQL Cusotmisations](roles/xbmc-mysql/README.md)
* [NAS Customisations](roles/xbmc-nas/README.md)
* [Sabnzbd Customisations](roles/sabnzbd/README.md)
* [Deluge Customisations](roles/deluge/README.md)
* [SickBeard Customisations](roles/sickbeard/README.md)
* [CouchPotato Customisations](roles/couchpotato/README.md)
* [HTPC-Manager Customisations](roles/htpc-manager/README.md)

## Development and Testing

### Prerequisites

#### Install Vagrant
If you want to test out the configuration in VirtualMachine, or contribute to htpc-ansible development,
download and install [Vagrant](http://www.vagrantup.com/)

Install [Oracle VM VirtualBox Extension Pack](http://download.virtualbox.org/virtualbox/4.3.10/Oracle_VM_VirtualBox_Extension_Pack-4.3.10-93012.vbox-extpack)

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
Vagrant box creates private network, with xbmc server available at <b>172.30.30.30</b>.
All the web services can be tested and configured through this address.
