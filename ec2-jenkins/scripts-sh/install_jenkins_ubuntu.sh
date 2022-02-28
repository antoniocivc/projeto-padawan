#! /bin/bash
sudo wget https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
sudo unzip terraform_1.1.6_linux_amd64.zip
sudo mv terraform /usr/bin/
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install default-jre -y
sudo apt install default-jdk -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
