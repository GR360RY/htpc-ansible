echo -e "\n\033[0;32m >> Install Requirements\033[0m"
sudo apt-get -y update 2>&1>/dev/null
sudo /usr/bin/apt-get -y install git python-pip
sudo /usr/bin/pip install -U ansible prompter

if [ ! -d "$HOME/htpc-ansible" ]; then
	echo -e  "\n\033[0;32m >> Clone htpc-ansible repository\033[0m"
	git clone git://github.com/GR360RY/htpc-ansible.git "$HOME/htpc-ansible"
else
	echo -e "\n\033[0;32m >> htpc-ansible is already available\033[0m"
fi
cd "$HOME/htpc-ansible"
echo -e "\n\033[0;32m >> Run Wizard\033[0m"
./scripts/wizard.py
echo -e "\n\033[0;32m >> Installing ...\033[0m"
ansible-playbook -i hosts -c local -K htpc-server.yml
