echo "\n\033[0;32m >> Install Git and Ansible\033[0m"
sudo /usr/bin/apt-get -y install git ansible
if [ ! -d "$HOME/htpc-ansible" ]; then
	echo "\n\033[0;32m >> Clone htpc-ansible repository\033[0m"
	git clone git://github.com/GR360RY/htpc-ansible.git "$HOME/htpc-ansible"
else
	echo "\n\033[0;32m >> htpc-ansible is already available\033[0m"
fi
cd "$HOME/htpc-ansible"
echo "\n\033[0;32m >> Install HTPC Server with Bittorent and Usenet Downloaders\033[0m"
ansible-playbook -i hosts -c local -K htpc-server.yml
