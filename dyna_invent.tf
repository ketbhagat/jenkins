resource "null_resource" "localinventory" {
	triggers = {
		current = timestamp()
	}
	provisioner "local-exec" {
	    command = "echo ${aws_instance.jenkins.tags.Name} ansible_host=${aws_instance.jenkins.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=/root/AWS2022.pem > inventory"
	}
	depends_on = [ 
		aws_instance.jenkins 
	]
}

