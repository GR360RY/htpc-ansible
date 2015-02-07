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

List of variables that can be passed to the role with default variable values::

    xbmc_mysqldb_host: "{{ ansible_default_ipv4.address }}"
    xbmc_mysqldb_user: xbmc
    xbmc_mysqldb_password: xbmc

    # If installed together with XBMC disable standalone mode.
    xbmc_standalone_mode: False        # Standalone box setup

    # The following variables should be defined in playbook if xbmc-mysql is added without xbmc-client role.

    media_path:                  # Location of xbmc media folders.

    xbmc_default_media_folders:       # Folder names for Movies, TV, Music and etc.
      movies: 
      tv: 
      music: 

Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with xbmc-mysql role:

     - xbmc-client
     - xbmc-nas
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


Example Playbook
-------------------------
Install XBMC mysql on separate host::

    - hosts: mysql-databases
      sudo: True

      vars:
        xbmc_mysqldb_user: xbmc
        xbmc_mysqldb_password: xbmc
        media_path: /mnt/xbmc

      xbmc_default_media_folders:
        movies: Movies
        tv: TV
        music: Music

      roles:
        - role: xbmc-mysql


Install xbmc-mysql together with xbmc-client and xbmc-nas::

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
