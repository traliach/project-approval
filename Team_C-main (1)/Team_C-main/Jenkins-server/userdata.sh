#!/bin/bash
# Install Java
sudo yum install -y java-1.8.0-openjdk

# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins

# Start Jenkins service
systemctl start jenkins
systemctl enable jenkins

# Open firewall for Jenkins port
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload
