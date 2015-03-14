htpc-manager
===========



Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

```
# htpc-manager branch
htpc_manager_repo: https://github.com/styxit/HTPC-Manager
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
     - htpc-manage

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