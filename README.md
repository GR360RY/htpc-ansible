## htpc-ansible
HTPC Server Automation with Kodi, Bittorent, Usenet Software, Couchpotato, Sickbeard, Tvheadend and nzbToMedia postinstallation scripts.

## Overview
This ansible playbook is designed to quickly deploy home HTPC server, which can perform variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine, or on a different ones, and can be customized through single configuration file, correctly deploying all the software.

- [Kodi](http://kodi.tv/‎) - Open Source Home Theatre Software, with optional mysql backend support (can be used to manage single library for multiple Kodi clients at home)
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

Choose roles/software and configure variables:

```
 >> Run Wizard
Install Kodi ? [Y/n]:
Install Kodi Mysql Backend? [Y/n]:
Install NAS services ? [Y/n]:
Install Deluge [Y/n]:
Install Sabnzbd [y/N]:
Install Sickbeard [Y/n]:
Install Couchpotato [Y/n]:
Install HTPC-Manager [Y/n]:
Install TVheadend [y/N]:
Media path [/mnt/media]:
Movies Folder [movies]:
TV Folder [tv]:
Music Folder [music]:
Pictures Folder [pictures]:
HTPC User [kodi]:
HTPC User password [kodi]:
```

__Reboot your machine following the installation.__

## Customizing the setup

The below list summarises tasks that will be performed in each role. Default variable values are appear in parentheses. 
Additional information is availalble for each role in README.md link.

* __kodi-client__ ([README.md](roles/kodi-client/README.md))
    - Install sshd service for remote access.
    - Create HTPC Linux User (`kodi`/`kodi`)
    - Create movies, tv, music, pictures and downloads folders under "Media Path" (`/mnt/media`)
    - Install latest Kodi version.
    - Configure HTPC user to autologin automatically and start Kodi software.
    - Enable Web Access to Kodi (username: `xbmc` and no password)

* __kodi-mysql__ ([README.md](roles/kodi-mysql/README.md))
    - Install Mysql Server
    - Create Initial Databases for Videos and Music

* __htpc-nas__ ([README.md](roles/htpc-nas/README.md))
    - Share "Media Path" (`/mnt/media`) over NFS
    - Share "Media Path" (`/mnt/media`) over CIFS to allow access from Windows Machines

* __deluge__ ([README.md](roles/deluge/README.md))
    - Install Deluge Daemon and configure to listen on port 8112
    - Install Deluge-Web Daemon and configure to listen on port 58846 ( default password `deluge`)
    - Create deluge downloads folders under "Media Path" ( `/mnt/media/downloads/incomplete/deluged` and `/mnt/media/downloads/incomplete/process`)
    - Create `localclient` user and identified by `2b9cf85259f2149da47458eda73ba23ac06faa21`

* __sabnzbd__ ([README.md](roles/sabnzbd/README.md))
    - Install Sabnzbdplus and configure to listen on port __9000__ ( Port number conflict with htpc-manager. Default port changed from 8080 )
    - Create sabnzbd incomplete downloads folder under "Media Path" ( `/mnt/media/downloads/incomplete/sabnzbd`)
    - Configure API Key for allowing access from htpc-manager, couchpotato and sickbeard (`c48afc846972e295826bb05d2e84dd59`)

* __sickbeard__ ([README.md](roles/sickbeard/README.md))
    - Install Sickbeard

* __couchpotato__ ([README.md](roles/couchpotato/README.md))
    - Install Couchpotato

* __htpc-manager__([README.md](roles/htpc-manager/README.md))
    - Install htpc-manager
    - Setup apache as reverse proxy to allow access to htpc-manager on port 80.

* __tvheadend__([README.md](roles/tvheadend/README.md))
    - Install Tvheadend


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
