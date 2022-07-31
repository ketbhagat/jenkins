resource "aws_instance" "jenkins" {
	ami = data.aws_ami.amazon_linux.id
	key_name = "AWS2022"
    	vpc_security_group_ids = [ "sg-0f33dc7a7f2ba3c66" ]
	instance_type =  "t2.micro"
	availability_zone = "us-east-1b"
	user_data = "${file("script.sh")}"
	tags  =  {  
			Name = "jenkins"
		}
}

resource "aws_volume_attachment" "wsc-jenkins-ebs" {
	force_detach = true
	device_name = "/dev/sdf"
	volume_id   = "vol-0d1702e24c247b694"
	instance_id = aws_instance.jenkins.id
}

resource "aws_instance" "jenkins-agent" {
        ami = data.aws_ami.amazonaminame.id
        key_name = "AWS2022"
        vpc_security_group_ids = [ "sg-0f33dc7a7f2ba3c66" ]
        instance_type =  "t2.micro"	
	availability_zone = "us-east-1b"
	user_data = "${file("script.sh")}"
	private_ip = "172.31.80.80"
       # user_data = "${file("install_jenkins.sh")}"
        tags  =  {
                        Name = "jenkins-agent"
                }
}
