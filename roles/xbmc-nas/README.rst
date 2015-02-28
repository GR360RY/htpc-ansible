xbmc-nas
===========

An ansible role to setup and configure NAS functionality ( NFS and Samba ) for HTPC Server under Debian based distro's.

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values::

    # Variables shared between this role and kodi-client role.
    # Default values are defined in kodi-client role.
    media_path:                  # Location of xbmc media folders.

    xbmc_default_media_folders:       # Folder names for Movies, TV, Music and etc.
      movies:
      tv:
      music:

    xbmc_download_folders:
      downloads:
      tmp:

    htpc_username:                    # User that will run XBMC
    

    # Variables share between this role, sabnzbd and deluge roles.
    # Defaults are define in each coresponding role.
    sabnzbd_incomplete:
    deluged_incomplete:

Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with kodi-client role::
    
     - kodi-client
     - xbmc-mysql
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


Example Playbook
-------------------------



License
-------

BSD

Author Information
------------------

Gregory Shulov
