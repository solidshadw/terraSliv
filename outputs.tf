############################################
## Dumps the AMI info out into a variable ##
############################################
output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "public_ip" {
  value = aws_instance.sliver-c2.public_ip # This will print on the screen what Public IP we need to ssh to.
}