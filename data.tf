data "aws_ami" "amazon_linux" {
	most_recent = true

	filter {
		name   = "name"
		values = ["amzn2-ami-hvm-2.0*"]
  	}

	filter {
		name   = "virtualization-type"
		values = ["hvm"]
	}	

	filter {
		name   = "root-device-type"
		values = ["ebs"]
	}

	owners = ["amazon"] # Canonical
}


data "aws_ami" "amazonaminame" {
	most_recent      = true
	owners           = ["amazon"]
	filter {
		name   = "name"
		values = ["amzn2-ami-kernel-*-x86_64-gp2"]
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
	value = data.aws_ami.amazon_linux
}

data "aws_availability_zones" "available" {}

output "azs" {
	value = data.aws_availability_zones.available.names
}
