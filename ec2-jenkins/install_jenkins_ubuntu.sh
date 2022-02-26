#! /bin/bash
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install default-jre -y
sudo apt install default-jdk -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins