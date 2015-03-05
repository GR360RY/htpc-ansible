Introduction
============

This ansible playbook is designed to quickly deploy home HTPC server, which can perform a variety of funcitons. It's based on an Ubuntu 14.04, and can set up several configuration variants. It includes roles, which can be set up on a single machine or on a multiple ones and can be customized through single configuration file, correctly deploying all the software.

Requirements
------------

#. Machine designated for an HTPC with Ubuntu 14.04 Desktop installed.
#. Correctly working name resolution on home network or "Static IP" configured on Ubuntu.

Software Roles
--------------

HTPC-Ansible incoroporates verious roles, where each role represents software package or service. All roles can be installed individually or together with other roles based on the required functionallity. Adding or removing roles will configure related services accordingly. 

The following roles are currently available as part of htpc-ansible:

* kodi-client - Kodi Open Source Home Theatre Software
* kodi-mysql - MySQL Backend for Kodi/XBMC ( Media library sharing for multiple Kodi/XBMC clients at home)
* htpc-nas - NAS configuration with support for sharing the library over NFS,CIFS
* htpc-manager - Web Front End for managing Kodi/XBMC, Couchpotato, Sick Beard, SABnzbd, Deluge and Tvheadend
* couchpotato - Download movies automatically
* sickbeard - Internet PVR for your TV Shows
* sabnzbd - NZB capable binary newsgrabber
* deluge  - Cross-platform BitTorrent client
* tvheadend - TV streaming server for Linux

.. seealso::

   :doc:`roles`