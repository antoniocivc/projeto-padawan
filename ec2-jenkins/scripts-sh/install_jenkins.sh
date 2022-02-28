#! /bin/bash
sudo wget https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
sudo unzip terraform_1.1.6_linux_amd64.zip
sudo mv terraform /usr/bin/
sudo yum update –y
sudo amazon-linux-extras install epel -y
sudo yum-config-manager --enable epel
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo chown -R jenkins /var/lib/jenkins
sudo chown -R jenkins /var/cache/jenkins
sudo chown -R jenkins /var/log/jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
 