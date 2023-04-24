resource "aws_instance" "ec2-instance" {
    ami = data.aws_ami.amzlinux2.id
    # instance_type = var.instance_type_list[0]
    instance_type = var.instance_type
    count = var.iterations
    user_data = file("app.sh")
    key_name = var.key_pair
    vpc_security_group_ids = [ aws_security_group.app-sg-ssh.id, aws_security_group.app-sg-web.id ]
    for_each = toset([data.aws_availability_zones.all.names])
    availability_zone = each.key
    tags = {
      "Name" = "ec2-instance-${each.value}"
    }
}