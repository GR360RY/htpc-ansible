#!/bin/sh

# Update apt sources.list to use local mirror
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git 'python(3?)-bs4$'
if [ ! -d "/opt/apt-select" ]; then
	sudo git clone https://github.com/GR360RY/apt-select.git /opt/apt-select
	cd /opt/apt-select
	sudo ./apt-select.py -t 3 -m one-week-behind
	sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
	sudo mv /opt/apt-select/sources.list /etc/apt/sources.list
	sudo apt-get update
fi
