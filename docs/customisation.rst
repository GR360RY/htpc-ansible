Customising the Setup
=====================

Install Prerequisites
---------------------

Install Ansible and Git
~~~~~~~~~~~~~~~~~~~~~~~

::

    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get -y install ansible git

Clone the repository
~~~~~~~~~~~~~~~~~~~~

::

    git clone https://github.com/GR360RY/htpc-ansible.git
    cd htpc-ansible

Edit Configuration::
~~~~~~~~~~~~~~~~~~~~

Open ``htpc-server.yml`` in your favorite editor and update vars section.
Most commonly changed variables are available in the htpc-server.yml file.
All variables with detailed desription are located in each role ``README.md`` file:

Run Ansible Playbook from your localhost
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    ansible-playbook -i hosts -c local -K htpc-server.yml

