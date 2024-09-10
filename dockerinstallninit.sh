#!/bin/bash

# First update
sudo apt update

# Install prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common net-tools

# Add the GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update 
sudo apt update

# Install Docker community edition
sudo apt install -y docker-ce

# Pull the Docker image, change the image below
sudo docker pull dockerhubid/imagename:tag

# Run Docker container in detached mode, run on port 443 if the image is configured as such
sudo docker run -d -p 80:80 dockerhubid/imagename:tag
