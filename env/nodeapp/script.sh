#!/bin/bash
echo -------------- Update source list --------------
sudo apt-get update -y

echo -------------- Install Python ------------------
sudo apt-get install software-properties-common -y

echo -------------- Remove Nodejs ------------------
sudo apt-get remove nodejs -y

echo -------------- Download node v16 ---------------
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

echo ------------------ Install node ----------------
sudo apt-get install -y nodejs

echo ------------------ Install npm -----------------
sudo apt-get install npm -y

echo ------------- Installing Apache ----------------
sudo apt install apache2 -y

echo ------------ Enabling Apache Proxy -------------
sudo a2enmod proxy
sudo a2enmod proxy_http

echo ------- Add nology Apache Proxy File -----------
sudo cp /home/ubuntu/app-to-distribute-solution/env/nodeapp/nology-proxy.conf /etc/apache2/sites-available
sudo echo ls -la /etc/apache2/sites-available

echo ------- Register nology Apache Proxy File ------
sudo a2ensite nology-proxy.conf

echo -------------- Restart Apache ------------------
sudo systemctl reload apache2

echo --------------- Move into App Folder -----------
cd /homne/ubuntu/app
pwd

echo -------------- Install Dependancies ------------
sudo npm install forever -g
npm install

echo -------------------- Run App -------------------
sudo forever stopall
sudo forever start index.js