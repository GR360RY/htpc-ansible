# htpc-ansible
HTPC Server Automation with XBMC, Bittorent and Usenet Software

# Overview
This ansible playbook is designed to quickly deploy home HTPC server, which can perform variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine, or on a different ones, and can be customized through single configuration file, correctly deploying all the software.

- [XBMC - Open Source Home Theatre Software](http://xbmc.org/‎), with optional mysql backend support (can be used to manage single library from multiple XBMC servers at home)
- NAS configuration with support for sharing the library over NFS and CIFS (AFP to come)
- [HTPC Manager - combines all your favorite software into one slick interface](http://htpc.io)
- [Couchpotato - download movies automatically](https://couchpota.to/)
- [Sick Beard - Internet PVR for your TV Shows](http://sickbeard.com)
- [SABnzbd - NZB capable binary newsgrabber](http://sabnzbd.org/)
- [Deluge -  Cross-platform BitTorrent client](http://deluge-torrent.org/)

# Installation

## Prerequisites

Machine designated for an HTPC with Ubuntu 14.04 Desktop installed

## Quick installation

Open terminal and run one of the following commands:

Install HTPC Server with Bittorent Downloader ( Deluge )
```bash
sh -c "`curl -fsSL https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server-torrents.sh`"
```

Install HTPC Server with Usenet Downloader ( Sabnzbd )
```bash
sh -c "`curl -fsSL https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server-usenet.sh`"
```
Install HTPC Server with both Bittorent and Usenet Downloaders
```bash
sh -c "`curl -fsSL https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server.sh`"
```

## Customizing the setup
To customize the setup - edit xbmc-client-server.yml

# Default configuration settings
Sabnzbd if installed, will run on port 9000 to avoid conflit with XBMC.
All other packages are configured with their default ports and settings, unless xbmc-client-server.yml has been modified.

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
