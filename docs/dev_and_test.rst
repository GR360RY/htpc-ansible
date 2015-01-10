Development and Testing 
=======================

Prerequisites
-------------

Install Vagrant
~~~~~~~~~~~~~~~

If you want to test out the configuration in VirtualMachine or contribute to htpc-ansible development,
download and install Vagrant_.

Install VirtualBox_.

Install snapshot plugin for Vagrant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will use a vagrant-multiprovider-snap_ to roll machine back instead of recreating box from scratch::

	vagrant plugin install vagrant-multiprovider-snap

Deployment
~~~~~~~~~~

Bringing up the machine

Bring up ubuntu desktop only::
	
	vagrant up --no-provision

Snapshot the machine::
	
	vagrant snap take

Deploying htpc-ansible::
	
	vagrant provision

Reverting snapshot::
In case you want to redeploy from scratch - simply revert the snapshot back to the machine with desktop installed.::
	
	vagrant snap rollback


Testing and configuring WEB services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vagrant box is configured to have bridged eth1 interface.
All the web services can be tested and configured through http://htpc-vm/

.. _Vagrant: http://www.vagrantup.com/
.. _Virtualbox: https://www.virtualbox.org/wiki/Downloads
.. _vagrant-multiprovider-snap: https://github.com/scalefactory/vagrant-multiprovider-snap