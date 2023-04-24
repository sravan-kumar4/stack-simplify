# Terraform settings block

provider "aws" {
    region = var.aws_region
    profile = "default"
}

resource "aws_security_group" "app-sg-ssh" {
    name = "app-sg"
   
    description = "ssh-security group"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "app-sg-web" {
    name = "ssh-gg-web"
    
    description = "web - securitygroup"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


resource "aws_instance" "ec2-instance" {
    ami = "ami-0caf778a172362f1c"
    instance_type = var.instance_type
    count = 3
    user_data = file("app.sh")
    key_name = var.key_pair
    vpc_security_group_ids = [ aws_security_group.app-sg-ssh.id, aws_security_group.app-sg-web.id ]
    tags = {
      "Name" = "ec2-instance${count.index}"
    }
}
