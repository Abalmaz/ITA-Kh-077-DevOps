#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl start docker
docker run -p 8080:80 nginx
