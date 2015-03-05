htpc-nas
===========

An ansible role to setup and configure NAS functionality ( NFS and Samba ) for HTPC Server under Debian based distro's.

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

```yaml
media_path:                  # Location of xbmc media folders.

htpc_username:               # HTPC User that will own the media_path
htpc_user_password:          # HTPC User Password
```


Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with kodi-client role:
    
     - kodi-client
     - kodi-mysql
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


License
-------

BSD

Author Information
------------------

Gregory Shulov
