xbmc-mysql
===========

An ansible role to setup and configure XBMC Mysql Database under Debian based distro's.

List of tasks that will be performed under xbmc-mysql role:

1. Install Mysql Serever
2. Create Initial XBMC Database with preconfigured Movies and TV Shows Sources

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

    xbmc_standalone_mode: False                 # Standalone box setup. No NAS and xbmc DB sharing.
    xbmc_mysqldb_user: xbmc                     # Mysql user
    xbmc_mysqldb_password: xbmc                 # Mysql password


The following variables should be defined in playbook if xbmc-mysql is added without xbmc-client role.

    xbmc_media_path:                            # Location of xbmc media folders.

    xbmc_default_media_folders:                 # Default folder names for Movies, TV, Music and etc.
      movies:
      tv:
      music:


For Home networks with correctly defined DHCP/DNS in frastructures. Use Hostnames and not "IP Address" when setting up communication between hosts and services.

    use_hostnames: False                        # Use hostnames

Dependencies
------------

This role is a part of `htpc-ansible` meta role that includes additional set of components required for HTPC automation.

The following list of roles can be used together with xbmc-mysql role:

     - htpc-ansible                             # Meta role that includes HTPC components
     - xbmc-client
     - xbmc-nas
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager


Example Playbook
-------------------------
Install XBMC mysql on separate host.

	- hosts: mysql-databases
	  sudo: True

	  vars:
	  	xbmc_mysqldb_user: xbmc
		xbmc_mysqldb_password: xbmc
		xbmc_media_path: /mnt/xbmc

	    xbmc_default_media_folders:
		  movies: Movies
		  tv: TV
		  music: Music

	  roles:
	  	- role: xbmc-mysql


Install xbmc-mysql together with xbmc-client and xbmc-nas.

    - hosts: htpc-server
      sudo: True

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
