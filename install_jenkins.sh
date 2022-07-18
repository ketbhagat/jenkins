#!/bin/bash
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
	https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install java -y
sudo yum install jenkins -y
sudo yum install git -y
sudo mount /dev/xvdf /var/lib/jenkins/
sudo systemctl daemon-reload
sudo systemctl enable jenkins --now
