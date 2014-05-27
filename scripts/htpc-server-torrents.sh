echo "\n\033[0;32m >> Install Git and Ansible\033[0m"
/usr/bin/apt-get -y install git ansible git
echo "\n\033[0;32m >> Clone htpc-ansible repository\033[0m"
git clone git@github.com:GR360RY/htpc-ansible.git
cd htpc-ansible
echo "\n\033[0;32m >> Install HTPC Server with Bittorent Downloader\033[0m"
ansible-playbook -i hosts -c local -K htpc-server-torrents.yml