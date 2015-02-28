deluge
===========

An ansible role to setup and configure Deluge Daemon and Deluge-Web under Debian based distro's.

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Role Variables
--------------

List of variables that can be passed to the role with default variable values.

Default vars scope with values (defaults/main.yml):

```yaml
deluge_enabled: True

# Deluge Daemon Path
deluged_path: /opt/deluged
deluged_user: debian-deluged

# Default download locations:
media_path: /mnt/media
downloads_path: "{{ media_path }}/downloads"
deluged_incomplete: "{{ downloads_path }}/incomplete/deluged"

# Required for nzbtomedia processing
process_path: "{{ downloads_path }}/incomplete/process"  

deluged_localclient_password: 2b9cf85259f2149da47458eda73ba23ac06faa21

deluged_host: "{{ ansible_default_ipv4.address }}"
deluged_port: 8112
```

Helper variable aslo used in other roles (vars/main.yml):

```yaml
# Make sure nzbtomedia script will be owned by deluged_user
nzbtomedia_user: "{{ deluged_user }}"
```


Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

Dependant on `nzbtomedia` role for automating postprocessing with `sickbeard` and `couchpotato`.

The following list of roles can be used together with kodi-client role:

```    
 - kodi-client
 - xbmc-mysql
 - xbmc-nas
 - sickbeard
 - couchpotato
 - subnzbd
 - htpc-manager
 - tvheadend
```

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


License
-------

BSD

Author Information
------------------

Gregory Shulov
