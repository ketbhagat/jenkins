#!/bin/bash
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade -y
yum install java-11-openjdk -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins --now
