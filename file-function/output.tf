output "ami" {
    description = "The Ami of the instance:"
    value = data.aws_ami.amzlinux2
}

output "public_ip" {
  description = "The public ip of the instance"
  value = [for instance in aws_instance.ec2-instance: instance.public_ip]
}

output "public_dns" {
  description = "The public dns of the instance"
  value = [for instance in aws_instance.ec2-instance: instance.public_dns]
}

output "Private_ip" {
    description = "The Private ip of the instance"
    value = [for instance in aws_instance.ec2-instance: instance.private_ip]
}