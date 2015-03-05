kodi-mysql
===========

An ansible role to setup and configure Kodi Mysql Database under Debian based distro's. This role creates empty Music and Videos Databases with preconfigured media paths.


Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

```yaml
kodi_mysqldb_host: "{{ ansible_default_ipv4.address }}"
kodi_mysqldb_user: kodi
kodi_mysqldb_password: kodi


media_path:                 # Location of xbmc media folders.

movies_folder:
tv_folder:
music_folder:
```

Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with kodi-mysql role:

     - kodi-client
     - htpc-nas
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager
     - tvheadend

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


Example Playbook
-------------------------

```
- hosts: htpc-server

  vars:
    kodi_mysqldb_user: xbmc
    kodi_mysqldb_password: xbmc
    media_path: /mnt/xbmc

    movies_folder: movies
    tv_folder: tv
    music_folder: music

  roles:
    - role: kodi-mysql
```

License
-------

BSD

Author Information
------------------

Gregory Shulov
