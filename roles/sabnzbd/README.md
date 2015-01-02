sabnzbd
=======

An ansible role to setup and configure Sabnzbd under Debian based distro's.

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

``` 
sabnzbd_port: 9000
sab_apikey: c48afc846972e295826bb05d2e84dd59


# Default Sabnzbd host IP or hostname. Used by other roles.
sabnzbd_host: "{{ ansible_default_ipv4.address }}"

sabnzbd_download_dir: /opt/sabnzbd/Downloads
sabnzbd_incomplete_dir: /opt/sabnzbd/sabnzbd_incomplete

# Uninitialised variables

# User that will run the service and will own downloded files (required)
sabnzbd_user:

newsgroups_servers:
  - name:
    username:
    password:
    connections:
```



Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with sabnzbd role:
    
- xbmc-client
- xbmc-mysql
- sickbeard
- couchpotato
- subnzbd
- deluge
- htpc-manager
- tvheadend


Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


Example Playbook
----------------

```
- hosts: all
  sudo: True

  vars:
    sabnzbd_user: johnd  

    # Single or multiple news servers can be defined.
    newsgroups_servers:
      - name: news.someserver.com
        username: foo
        password: bar
        connections: 10
      - name: eu.news.someserver.com
        username: foo
        password: bar
        connections: 10
    
  roles:
    - role: sabnzbd
```

License
-------

BSD

Author Information
------------------

Gregory Shulov