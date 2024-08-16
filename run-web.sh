#!/bin/bash

if ! command -v docker &> /dev/null; then
	echo "Installing docker"
	#https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
	# Add Docker's official GPG key:
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update

	#Install latest version of docker
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	
	echo "Docker installation completed"

	#Adding libssl1.1 for ubuntu 24.04 to run mongodb
	wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
	sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
	# https://www.mongodb.com/community/forums/t/installing-mongodb-over-ubuntu-22-04/159931/30
else
	echo "Docker already installed, skipping installation"
fi

#Clone the repository
echo "Cloning remote github repository"
git clone git@github.com:PhiThai1309/real-estate.git

#Change to the working directory
cd real-estate

#Set executable permission to import.sh
chmod +x ./database/import.sh

#Run docker containers
sudo docker compose up -d
