xbmc-nas
===========



Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

    xbmc_repo: 'ppa:team-xbmc/ppa'              # xbmc apt repository. can be changed to unstable
    xbmc_media_path: /mnt/xbmc                  # Location of xbmc media folders.

    xbmc_default_media_folders:                 # Default folder names for Movies, TV, Music and etc.
      movies: Movies
      tv: TV
      music: Music

    xbmc_download_folders:
      downloads: Downloads
      tmp: tmp

    xbmc_user_name: xbmc                        # User that will run xbmc and related htpc services
    xbmc_user_password: xbmc                    # User's Password
    xbmc_enable_ubuntu_desktop: True            # Start xbmc as part of Ubuntu desktop
    xbmc_standalone_mode: True                  # Standalone box setup. No NAS and xbmc DB sharing.
    xbmc_mysqldb_host: localhost                # Mysql host for shared xbmc database.
    xbmc_mysqldb_user: xbmc                     # Mysql user
    xbmc_mysqldb_password: xbmc                 # Mysql password
    xbmc_with_download_clinets: False           # Don't create downloads and temporary folders.
    
    xbmc_external_nas:                          # Can be passed to role to use external NFS storage.

For Home networks with correctly defined DHCP/DNS in frastructures. Use Hostnames and not "IP Address" when setting up communication between hosts and services.

    use_hostnames: False                        # Use hostnames

Dependencies
------------

This role is a part of `htpc-ansible` meta role that includes additional set of components required for HTPC automation.

The following list of roles can be used together with xbmc-client role:

	- htpc-ansible								# Meta role that includes HTPC components
	- xbmc-mysql
	- xbmc-client                              
	- sickbeard
	- couchpotato
	- subnzbd
	- deluge
	- htpc-manager


Example Playbook
-------------------------

Install XBMC, Mysql and NAS services on htpc-server

	- hosts: htpc-server
	  sudo: True

      roles:
        - role: xbmc-client
        - role: xbmc-mysql
      	- role: xbmc-nas

Don't install NAS services. Use already available external NFS storage.
The role will configure autofs direct map to access externla NFS storage under share
/tank/Media. The same path will be used locally.

	- hosts: htpc-server
	  sudo: True

	  vars: 
		xbmc_external_nas: 10.0.0.10    # External NAS IP or Name
		xbmc_media_path: /tank/Media    # Will be used as external NFS share

	    xbmc_media_folders:
		  movies: Movies
		  tv: TV
		  music: Music

	  roles:
		- role: xbmc-client
		- role: xbmc-mysql
		- role: xbmc-nas


License
-------

BSD

Author Information
------------------

Gregory Shulov
