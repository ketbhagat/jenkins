resource "aws_instance" "jenkins" {
	ami = data.aws_ami.amazonaminame.id 
	key_name = "AWS2022"
    	vpc_security_group_ids = [ "sg-0f33dc7a7f2ba3c66" ]
	instance_type  =  "t2.micro"
	/*user_data = <<EOF
		#!/bin/bash
		wget -O /etc/yum.repos.d/jenkins.repo \
    			https://pkg.jenkins.io/redhat-stable/jenkins.repo
		rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
		yum upgrade -y
		yum install java-11-openjdk -y
		yum install jenkins -y
		systemctl daemon-reload
		systemctl enable jenkins --now
		EOF*/
	tags  =  {  
			Name = "jenkins"
		}
}
/*
resource "aws_instance" "os2" {	
	ami = data.aws_ami.amazonaminame.id
	key_name = "AWS2022"
        vpc_security_group_ids = [ "sg-0f33dc7a7f2ba3c66" ]
	instance_type  =  "t2.micro"
	tags  =  {  
			Name = "instanceos2"
		}
}
*/
