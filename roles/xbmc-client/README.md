xbmc-client
===========

An ansible role to setup and configure XBMC under Debian based distro's.

XBMC can be automatically configured in the following modes:

1. Standalone Mode
2. HTPC Server Mode
3. Client Mode

In "Standalone Mode" XBMC will opperate using local storage and local sqlite database.

In "HTPC Server Mode" XBMC will use mysql database installed on the same host as the xbmc-client or using external database installed on other host. When "Shared" mode is applied XBMC can be configured to use external NFS storage to allow "thin client" mode operation. ( See example 2 )

List of tasks that will be performed under xbmc-client role:

1. Install ssh server to allow remote management.
2. Setup XBMC user.
3. Configure LightDM to autlogin XBMC user and start XBMC automatically.
4. Enable XBMC Internal Web Server.

XBMC will be automatically started in "Full Screen" mode together with standard desktop environement or as separate LightDM session.


Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

```yaml
xbmc_repo: 'ppa:team-xbmc/ppa'      # xbmc apt repository. can be changed to unstable
xbmc_media_path: /mnt/xbmc          # Location of xbmc media folders.
xbmc_default_media_folders:         # Default folder names for Movies, TV, Music and etc.
  movies: Movies
  tv: TV
  music: Music

xbmc_download_folders:              # Default download folders
  downloads: Downloads
  tmp: tmp

xbmc_user_name: xbmc                # User that will run xbmc and related htpc services
xbmc_user_password: xbmc            # User Password
xbmc_enable_ubuntu_desktop: True    # Start xbmc as part of Ubuntu desktop
xbmc_standalone_mode: True          # Standalone box setup. No NAS and xbmc DB sharing.
xbmc_mysqldb_host: localhost        # Mysql host for shared xbmc database.
xbmc_mysqldb_user: xbmc             # Mysql user
xbmc_mysqldb_password: xbmc         # Mysql password
xbmc_dont_create_folders: False     # Skip creation of Media and Downloads folders
xbmc_with_download_clinets: False   # Skip creation of Downloads folders.

use_hostnames: False                # Use hostnames
xbmc_external_nas:                  # Can be passed to role to use external NFS storage.
```

Dependencies
------------

This role is a part of `htpc-ansible` meta role that includes additional set of components required for HTPC automation.

The following list of roles can be used together with xbmc-client role:

     - htpc-ansible                             # Meta role that includes HTPC components
     - xbmc-mysql
     - xbmc-nas
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager


Example Playbook
-------------------------

Stanalone mode installation on single host with default xbmc user ( xbmc/xbmc )

    - hosts: xbmc-clients

      roles:
        - role: xbmc-client


Single Client installation with external xbmc mysql database and external NAS. Default database credentials ( xbmc/xbmc ) are used.

    - hosts: xbmc-clients
      sudo: True

      vars:
        xbmc_mysqldb_host: 10.0.0.1
        xbmc_external_nas: 10.0.0.1
        xbmc_media_path: /tank/Media
        xbmc_dont_create_folders: True
        xbmc_standalone_mode: False

      roles:
        - role: xbmc-client


License
-------

BSD

Author Information
------------------

Gregory Shulov
