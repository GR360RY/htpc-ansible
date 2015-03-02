kodi-client
===========

An ansible role to setup and configure XBMC under Debian based distro's.

XBMC can be automatically configured in the following modes:

1. Standalone Mode
2. HTPC Server Mode
3. Client Only Mode

In "Standalone Mode" XBMC will opperate using local storage and local sqlite database.

In "HTPC Server Mode" XBMC will use mysql database installed on the same host as the kodi-client or using external database installed on other host. When "HTPC Server" mode is applied XBMC can be configured to use external NFS storage. ( See example 2 )

In "Client Only Mode" XBMC will be configured to use external database and external NAS by updating advancedsettings.xml. Should be installed on thin clients only.


List of tasks that will be performed under kodi-client role:

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

List of variables that can be passed to the role with default variable values::

    kodi_repo: 'ppa:team-xbmc/ppa'    # XBMC Ubuntu ppa.
    media_path: /mnt/xbmc        # Location of xbmc media folders.

    xbmc_default_media_folders:       # Folder names for Movies, TV, Music and etc.
      movies: Movies
      tv: TV
      music: Music

    xbmc_download_folders:
      downloads: Downloads
      tmp: tmp

    htpc_username: kodi              # User that will run kodi.
    htpc_user_password: kodi          # User's Password.
    kodi_enable_ubuntu_desktop: True  # Start XBMC as part of Ubuntu desktop.


    # When used together with deluge role, make sure deluge runs as xbmc user.
    deluged_user: "{{ htpc_username }}"

    # When used together with sabnzbd role, make sure sabnzbd runs as xbmc user.
    sabnzbd_user: "{{ htpc_username }}"

    # When used together with couchpotato role, make sure couchpotato runs as xbmc user.
    couchpotato_user: "{{ htpc_username }}"

    # When used together with sickbeard role, make sure sickbeard runs as xbmc user.
    sickbeard_user: "{{ htpc_username }}"

    # When used together with htpc-manager role, make sure htpc-manager runs as xbmc user.
    htpc_manager_user: "{{ htpc_username }}"


    # Uninitialised variables

    xbmc_mysqldb_host:                # Defaults initialised in xbmc-mysql role
    kodi_mysqldb_user:                # Defaults initialised in xbmc-mysql role
    kodi_mysqldb_password:            # Defaults initialised in xbmc-mysql role

    xbmc_external_nas:                # Use xbmc with external NAS

    # Default xbmc host IP. Used by other roles.
    kodi_host: "{{ ansible_default_ipv4.address }}" 


Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with kodi-client role:

- xbmc-mysql
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
----------------

Stanalone Mode installation on single host with default xbmc user ( xbmc/xbmc )::

    - hosts: kodi-clients

      roles:
        - role: kodi-client


HTPC Server Mode installation with external xbmc mysql database and external NAS. Automounter will be configured allow direct access to Media files::

    - hosts: kodi-clients
      sudo: True

      vars:
        htpc_username: foo
        htpc_user_password: bar
        xbmc_mysqldb_host: 10.0.0.1
        kodi_mysqldb_user: xbmc
        kodi_mysqldb_password: xbmc
        xbmc_external_nas: 10.0.0.1
        media_path: /tank/Media
        xbmc_standalone_mode: False
        kodi_enable_ubuntu_desktop: False

      roles:
        - role: kodi-client

License
-------

BSD

Author Information
------------------

Gregory Shulov
