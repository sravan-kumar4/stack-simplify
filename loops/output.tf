output "public_dns" {
  description = "this is legacy splat operator for public dns"
  value = aws_instance.ec2-instance[*].public_dns
}

output "private_dns_normalsplat" {
  value = aws_instance.ec2-instance.*.private_dns
  
}
output "public_ip" {
  value = [for instance in aws_instance.ec2-instance: instance.public_ip ]
}

output "public_dns-toset" {
  value = tomap({for s, instance in aws_instance.ec2-instance: s => instance.public_dns}) # s intends to be subnet id
}

output "instance-id"{
  value = toset([ for i in aws_instance.ec2-instance: i.id])
}