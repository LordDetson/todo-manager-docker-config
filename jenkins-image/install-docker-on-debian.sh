#!/bin/sh

echo "Update the apt package index"
apt-get update

echo "Install packages to allow apt to use a repository over HTTPS"
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	
echo "Add Docker’s official GPG key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Set up the repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
echo "Install Docker Engine, containerd, and Docker Compose"
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Add your user to the docker user group"
usermod -aG docker $USER

echo "Activate the changes to groups"
newgrp docker

echo "Done"