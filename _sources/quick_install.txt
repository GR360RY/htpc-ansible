Quick Installation
==================

Login to your Ubuntu 14.04 machine using gui or console.
Open terminal and run the below command::

    wget --no-check-certificate https://raw.github.com/GR360RY/htpc-ansible/master/scripts/htpc-server.sh -O - | sh

.. note::

    Reboot your machine following the installation.

What will be installed and configured ?
```````````````````````````````````````

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