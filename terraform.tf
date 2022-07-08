#Terraform
terraform {
	required_version = "1.2.4"
	required_providers {
		wellspringcloud = {
			source  = "registry.terraform.io/hashicorp/aws"
			version = "~> 4.19"
		}
	}
}
