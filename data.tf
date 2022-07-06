data "aws_ami" "amazonaminame" {
	most_recent      = true
	owners           = ["amazon"]
	filter {
		name   = "name"
		values = ["amzn2-ami-*-gp2"]
	}
	filter {
		name   = "root-device-type"
		values = ["ebs"]
	}
	filter {
		name   = "virtualization-type"
		values = ["hvm"]
	}
	filter {
		name   = "architecture"
		values = ["x86_64"]
	}
}

output "ami_id" {
	value = data.aws_ami.amazonaminame
}

data "aws_availability_zones" "available" {}

output "azs" {
	value = data.aws_availability_zones.available.names
}
