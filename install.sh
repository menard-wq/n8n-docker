#!/bin/bash
echo "--------- Start install docker -----------"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce
echo "--------- Finish install docker -----------"
echo "--------- Start creating folder -----------"
cd ~
mkdir n8n-data
sudo chown -R 1000:1000 n8n-data
sudo chmod -R 755 n8n-data
echo "--------- Finish creating folder -----------"
echo "--------- Start docker compose up  -----------"
wget https://raw.githubusercontent.com/menard-wq/n8n-docker/refs/heads/main/docker-compose.yaml -O compose.yaml
export EXTERNAL_IP=http://"$(hostname -I | cut -f1 -d' ')"
sudo -E docker compose up -d
echo "--------- Finish! Wait a few minutes and test in browser for n8n UI -----------"
